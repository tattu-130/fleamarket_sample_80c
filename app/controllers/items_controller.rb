class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

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

  def set_item
    @item = Item.find(params[:id])
  en
end
