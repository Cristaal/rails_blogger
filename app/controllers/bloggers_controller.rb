class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
    render :index
  end

  def new
    @blogger = Blogger.new
    render :new
  end

  def create
    @blogger = Blogger.new(params[:blogger])
    if @blogger.save
      redirect_to bloggers_path
    else
      render :new
    end
  end
end
