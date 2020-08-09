class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all
  end
  

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :show
      puts "削除に失敗しました"
    end
  end

  def show
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
