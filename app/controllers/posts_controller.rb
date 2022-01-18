class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.first_three
  end

  def show
    user = User.find(params[:user_id])
    @post = user.posts.find(params[:id])
  end
end
