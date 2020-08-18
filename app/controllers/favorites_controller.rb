class FavoritesController < ApplicationController

  before_action :set_item, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.create(favorite_params)
    @favorites_count = Favorite.where(item_id: params[:item_id]).count
  end

  def destroy
    current_user.favorites.find_by(item_id: params[:item_id]).destroy
    @favorites_count = Favorite.where(item_id: params[:item_id]).count
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def favorite_params
    params.permit(:item_id)
  end
end


