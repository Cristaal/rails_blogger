class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @post = Post.new
  end

  #   @post = Post.new
  # end

  # def create
  #   @user = User.find(current_user.id)
  #   @post = @user.posts.new(posting_params)
  #   if

end
