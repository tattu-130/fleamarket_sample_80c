class ItemsController < ApplicationController
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
    item = Item.find(params[:id])
    item.destroy
  end

  def show
  end
end
