class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :invite_parmas, only: %i[create]

  def create
    if current_user.inverse_pending_friends.to_a.include? User.find(params[:friend_id])
      redirect_to users_path and return
    end

    invite = current_user.invitations.build(friend_id: params[:friend_id], is_accepted: false)
    invite.is_accepted = false
    invite.save
    redirect_to users_path
  end

  def destroy
    invite = Invitation.find_by(user_id: params[:user_id], friend_id: current_user.id)
    inverse_invite = Invitation.find_by(user_id: current_user.id, friend_id: params[:user_id])
    invite&.delete
    inverse_invite&.delete
    redirect_to users_path
  end

  def accept_invite
    current_user.confirm_friend(User.find(params[:user_id]))
    flash[:notice] = 'Friend request accepted'
    redirect_to users_path
  end

  private

  def invite_parmas
    params.permit(:friend_id)
  end
end
