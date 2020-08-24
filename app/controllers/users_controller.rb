class UsersController < ApplicationController
  before_action :set_search, only: [:index, :show, :detail_search]
  before_action :set_parents, only: [:index, :show]

  def index
    @favorite = Item.joins(:favorites).where(favorites: {user: current_user.id})
  end

  def show
    @user = current_user
    @nickname = @user.nickname
    @image = @user.user_image
    @user_des = @user.destination
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end


  private

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

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :user_image, :introduction)
  end

end

