class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    if params[:posts_for] == "current"
      @posts = current_user.posts
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post Successfully Added!"
      redirect_to posts_path
    else
      flash[:danger] = "There was a problem creating your post, please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post Successfully Updated"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = "Post Successfully Deleted!"
    redirect_to user_path(@user)
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
