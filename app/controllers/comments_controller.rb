class CommentsController < ApplicationController

  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments, status: :ok
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(**comment_params, post: post)
    if comment.save
      render json: {success: true}, status: :created
    else
      render json: {success: false}, status: :bad_request
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy!
    flash[:success] = 'Removed comment!'
    redirect_back fallback_location: [post.author, post]
  end

  private

  def comment_params
    params.permit(:text)
  end
end
