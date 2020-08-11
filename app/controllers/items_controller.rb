class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    # @items = Item.includes(:item_imgs).order('created_at DESC')
#     大橋さんの記述を一旦コメントアウトします。必要に応じて使ってください。
    @items = Item.all.order("created_at DESC").limit(5)
  end
  

  def new
    @item = Item.new
    @item.item_imgs.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
      puts "失敗"
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :show
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, item_imgs_attributes: [:src]).merge(:user_id => current_user.id)
  end

end


