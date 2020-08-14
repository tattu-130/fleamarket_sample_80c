class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :update, :edit]
  before_action :set_parents, only: [:index, :new, :create]

  def index
    @items = Item.includes(:item_imgs).order('created_at DESC')
#     大橋さんの記述を一旦コメントアウトします。必要に応じて使ってください。
#     @items = Item.all.order("created_at DESC").limit(5) 
  end
  
  def new
    @item = Item.new
    @item.item_imgs.new
  end


  def create
    @item = Item.new(item_params)
    # if @item.save!
    if @item.save
      redirect_to root_path
    else
      render :new
      puts "失敗"
    end
  end
  
  def show
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def item_params
    # params.require(:item).permit(:name, :price, item_imgs_attributes: [:src, :_destroy, :id]).merge(:user_id => current_user.id, :prefecture => params[:item][:prefecture].to_i, :delivery_days => params[:item][:delivery_days].to_i, :item_condition => params[:item][:item_condition].to_i)

    params.require(:item).permit(:name, :detail, :price, :postage, :delivery_days, :item_condition, :prefecture, item_imgs_attributes: [:src, :_destroy, :id]).merge(:user_id => current_user.id)
  end

end


