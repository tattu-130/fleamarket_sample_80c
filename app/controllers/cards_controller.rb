class CardsController < ApplicationController
  before_action :set_card, only: [:destroy, :show]
  before_action :set_search, only: [:new, :show]

  require "payjp"

  def new
    if user_signed_in?
      card = Card.where(user_id: current_user.id)
      redirect_to action: :show if card.exists?
    else
      redirect_to new_user_session_path
    end
  end

  def create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials[:pay_jp][:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    if @card.present?
      Payjp.api_key = Rails.application.credentials[:pay_jp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials[:pay_jp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_search
    if params[:q].present?
      @q = Item.ransack(params[:q])
      @items = @q.result(distict: true)
    else
      params[:q] = { sorts: 'id desc' }
      @q = Item.ransack()
      @items = Item.all
    end
  end
end