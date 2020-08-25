class CommentsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @comment = Comment.find
    @comments = @item.comments.includes(:user)
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to "/items/#{@item.id}", notice: 'コメントが送信されました'
  end

  private

  def comment_params
    params.permit(:comment, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end