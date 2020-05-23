class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    invite = current_user.invitations.build(invite_parmas)
    invite.is_accepted = false
    invite.save
    redirect_to current_user
  end

  def destroy
    invite = Invitation.find_by(user_id: params[:user_id],friend_id: current_user.id )
    inverse_invite = Invitation.find_by(user_id: current_user.id,friend_id: params[:user_id])
    invite.delete if invite
    inverse_invite.delete if inverse_invite
    redirect_to current_user
  end

  def accept_invite
    current_user.confirm_friend(User.find(params[:user_id]))
    flash[:notice] = 'Friend request accepted'
    redirect_to current_user
  end

  private
  def invite_parmas
    params.permit(:friend_id)
  end
end
