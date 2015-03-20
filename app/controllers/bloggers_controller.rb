class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
    render :index
  end

  def new
    @blogger = Blogger.new
    render :new
  end

  def show
    @blogger = Blogger.find(params[:id])
    render :show
  end

  def create
    @blogger = Blogger.new(params[:name])
    if @blogger.save
      redirect_to bloggers_path
    else
      render :new
    end
  end

  private
  def blogger_params
    params.require(:blogger).permit(:name)
  end


end
