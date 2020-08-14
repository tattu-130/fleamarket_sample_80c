class FavoritesController < ApplicationController

  before_action :set_item, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.create(favorite_params)
    redirect_to item_path(@item)
  end

  def destroy
    @favorite = Favorite.find_by(favorite_params, user_id: current_user.id)
    @favorite.destroy
    redirect_to item_path(@item)
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def favorite_params
    params.permit(:item_id)
  end
end


