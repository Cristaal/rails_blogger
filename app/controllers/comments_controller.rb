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

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment Successfully Updated"
      redirect_to post_path(@comment.post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment Successfully Deleted!"
    redirect_to posts_path(@posts)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
