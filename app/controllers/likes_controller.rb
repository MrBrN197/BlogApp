class LikesController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:id])
    deja_like = post.likes.find_by(author: current_user)
    if deja_like
      flash[:alert] = 'You\'ve already liked this post!'
    else
      current_user.likes.create!(post: post)
      flash[:success] = 'Liked!'
    end
    redirect_to user_post_url
  end
end
