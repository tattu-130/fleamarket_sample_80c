class CommentsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @comment = Comment.find
    @comments = @item.comments.includes(:user)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/items/#{@item.id}", notice: 'コメントが送信されました'
    else
      @comments = @item.comments.includes(:user)
      flash.now[:alert] = 'コメントを入力してください。'
      render :index
    end
  end

  private

  def comment_params
    params.permit(:comment, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end