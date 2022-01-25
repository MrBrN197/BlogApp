class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(**comment_params, post: post)
    if comment.save
      flash[:success] = 'Created A new comment'
    else
      flash[:fail] = 'Failed To Create a Comment'
    end
    redirect_back fallback_location: users_url
  end

  def destroy
    puts 'Removing Comment'
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy!
    redirect_back fallback_location: [post.author, post]
  end

  private

  def comment_params
    params.permit(:text)
  end
end
