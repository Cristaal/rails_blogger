class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post Successfully Added!"
      redirect_to root_path
    else
      flash[:danger] = "There was a problem creating your post, please try again."
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :body)
    end
end
