class PurchaseController < ApplicationController
  before_action :set_item, only: [:index, :pay, :done]
  before_action :set_card, only: [:index, :pay]
  require 'payjp'

  def index
    if user_signed_in? && @item.user_id != current_user.id && @item.buyer == 0
      if @card.blank?
        redirect_to controller: "cards", action: "new"
      else
        Payjp.api_key = Rails.application.credentials[:pay_jp][:PAYJP_SECRET_KEY]
        #保管した顧客IDでpayjpから情報取得
        customer = Payjp::Customer.retrieve(@card.customer_id)
        #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
    else
      redirect_to new_user_session_path
    end
  end

  def pay
    if user_signed_in? && @item.user_id != current_user.id
      Payjp.api_key = Rails.application.credentials[:pay_jp][:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
      amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      @item.update(buyer: true)
      redirect_to action: 'done' #完了画面に移動
    else
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_card
    if user_signed_in?
      @card = Card.find_by(user_id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end
end
