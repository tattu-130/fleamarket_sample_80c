class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    user = User.find(current_user.id)
    @user_des = user.destination
  end
end
