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
    invite.delete
    redirect_to current_user
  end

  private
  def invite_parmas
    params.permit(:friend_id)
  end
end
