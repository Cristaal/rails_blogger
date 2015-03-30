class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Your Comment Has Been Added!"
      redirect_to post_path(@comment.post)
    else
      flash[:danger] = "There was a problem creating your comment, please try again."
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
