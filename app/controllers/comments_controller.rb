class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :js, :html, :json

  def index
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_id: @post.id)
    respond_to do |format|
      format.html { render :new }
      format.js
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.post.user.send_message(@comment.body)
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post) }
          flash[:success] = "Your Comment Has Been Added!"
        format.js
      end
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
    respond_to do |format|
      format.html { render :new }
      format.js
    end
  end

  def update
    @user = User.find(current_user.id)
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post) }
          flash[:success] = "Comment Successfully Updated"
        format.js
      end
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
