class MembershipsController < ApplicationController
  def create
    membership = Membership.create(membership_params)

    if membership.save
      club = Club.find(membership.club_id)

      redirect_to player_path(membership.player_id), notice: "Successfully joined #{club.name}"
    else
      redirect_to player_path(membership.player_id), alert: membership.errors.full_messages.join('. ')
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:player_id, :club_id)
  end
end
