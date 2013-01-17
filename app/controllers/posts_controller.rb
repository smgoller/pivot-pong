class PostsController < ApplicationController
  skip_before_filter :authenticate

  def index
    @posts = Post.paginate(:page => params[:page]).order("created_at DESC")
  end
end