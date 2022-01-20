class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.first_three
  end

  def show
    # user = User.find(params[:user_id])
    # @post = user.posts.find(params[:id])
    @post = Post.find(params[:id])
  end

  def new
    user = User.find(params[:user_id])
    post = user.posts.new
    render :new, locals: { post: post }
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.new(params.require(:post).permit(:title, :text))
    @user = user
    @posts = user.posts
    if post.save
      flash[:success] = 'Created New Post succesfully'
      redirect_to user_posts_url
    else
      flash.now[:fail] = 'Failed to Create New Post'
      render :new, locals: { post: post }
    end
  end
end
