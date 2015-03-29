class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end
end
