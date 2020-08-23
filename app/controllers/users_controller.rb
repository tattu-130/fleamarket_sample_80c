class UsersController < ApplicationController
  before_action :set_search, only: [:index, :show, :detail_search]
  before_action :set_parents, only: [:index, :show]

  def index
    @favorite = Item.joins(:favorites).where(favorites: {user: current_user.id})
  end

  def show
    @nickname = current_user.nickname
    @image = current_user.user_image
    @user_des = current_user.destination
  end

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


