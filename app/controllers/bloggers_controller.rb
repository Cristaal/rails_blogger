class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
    render :index
  end
end
