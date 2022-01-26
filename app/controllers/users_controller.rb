class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
