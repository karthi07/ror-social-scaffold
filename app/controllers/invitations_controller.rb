class InvitationsController < ApplicationController
  def create
    invite = current_user.invitations.build(invite_parmas)
    invite.is_accepted = false
    invite.save
    redirect_to root_path
  end

  def destroy
  end

  private
  def invite_parmas
    params.permit(:friend_id)
  end
end
