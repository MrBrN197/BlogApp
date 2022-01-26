class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.first_three.includes(:comments)
  end

  def show
    user = User.find(params[:user_id])
    @post = user.posts.includes(:comments).find(params[:id])
  end

  def new
    post = current_user.posts.new
    render :new, locals: { post: post }
  end

  def create
    post = current_user.posts.new(post_params)
    authorize! :create, post
    @user = current_user
    @posts = @user.posts
    if post.save
      flash[:success] = 'Created New Post succesfully'
      redirect_to user_posts_url
    else
      flash.now[:fail] = 'Failed to Create New Post'
      render :new, locals: { post: post }
    end
  end

  def destroy
    post = Post.find(params[:id])
    authorize! :destroy, post
    post.destroy!
    redirect_to user_posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
