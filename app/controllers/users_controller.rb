class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user_requests = current_user.friend_requests
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def add_friend()
    byebug
    current_user.add_friend(params[:friend_id])
    render 'index'
  end
end
