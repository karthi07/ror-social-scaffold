class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user_requests = current_user.inverse_pending_friends
    @pending_requests = current_user.pending_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def add_friend()
    current_user.add_friend(params[:friend_id])
    render 'index'
  end
end
