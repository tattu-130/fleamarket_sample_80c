class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @user_des = current_user.destination
  end
end
