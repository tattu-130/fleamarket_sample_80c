class UsersController < ApplicationController

  def index
    @user = current_user.id
    @favorite = Item.joins(:favorites).where(favorites: {user: @user})
  end

  def show
    @nickname = current_user.nickname
    @image = current_user.user_image
    @user_des = current_user.destination
  end
end


