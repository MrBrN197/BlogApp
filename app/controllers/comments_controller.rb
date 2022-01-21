class CommentsController < ApplicationController
  def create
    post = Post.find(params[:id])
    comment = current_user.comments.new(**comment_params, post: post)
    if comment.save
      flash[:success] = 'Created A new comment'
    else
      flash[:fail] = 'Failed To Create a Comment'
    end
    redirect_to user_post_url
  end

  private

  def comment_params
    params.permit(:text)
  end
end
