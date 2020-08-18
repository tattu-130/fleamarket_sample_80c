class UsersController < ApplicationController
  before_action :set_parents, only: [:show]
  def show
    @nickname = current_user.nickname
    @image = current_user.user_image
    @user_des = current_user.destination
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
