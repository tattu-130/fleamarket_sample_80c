class UsersController < ApplicationController

  before_action :set_parents, only: [:index, :show]

  def index
    @favorite = Item.joins(:favorites).where(favorites: {user: current_user.id})
  end

  def show
    @nickname = current_user.nickname
    @image = current_user.user_image
    @user_des = current_user.destination
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

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :user_image, :introduction)
  end

end

