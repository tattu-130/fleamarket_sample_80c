class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @image = current_user.user_image
    @user_des = current_user.destination
  end
end
