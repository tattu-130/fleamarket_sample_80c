class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :update, :edit]
  before_action :set_parents, only: [:index, :new, :create, :edit, :update, :show]
  before_action :set_search, only: [:index, :show, :detail_search]

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
    # if @item.save!
    if @item.save
      redirect_to root_path
    else
      render :new
      puts "失敗"
    end
  end
  
  def show
    @favorites_count = Favorite.where(item_id: params[:id]).count
    @comment = Comment.new
    @commentALL = @item.comments
  end

  def destroy
    if user_signed_in? && @item.user_id == current_user.id
      if @item.destroy
        redirect_to items_path
      else
        render :show
      end
    else 
      redirect_to new_user_session_path
    end
  end

  def edit
    if user_signed_in? && @item.user_id == current_user.id
      @grandchild_category = @item.category
      @child_category = @grandchild_category.parent 
      @category_parent = @child_category.parent
      @category = Category.find(@category_parent.id)
      @category_children = @item.category.parent.parent.children
      @category_grandchildren = @item.category.parent.children
    else 
      redirect_to new_user_session_path
    end
  end

  def update
    if user_signed_in? && @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to root_path
      else
        render :edit
      end
    else
      redirect_to new_user_session_path
    end
  end

  def category_children  
    @category_children = Category.find(params[:parent_id]).children
  end
  
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def search
    @items = Item.search(params[:keyword])
    @item = params.permit(:keyword)
  end
  
  def detail_search
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

  def set_item
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def item_params
    params.require(:item).permit(:name, :detail, :price, :postage, :delivery_days, :item_condition, :category_id, :prefecture, item_imgs_attributes: [:src, :_destroy, :id]).merge(:user_id => current_user.id)
  end

end
