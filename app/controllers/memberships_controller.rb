class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      redirect_to root_path, notice: 'Joined Club'
    else
      flash.now[:alert] = 'Membership failed to save'
      render :new
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:club_id, :player_id)
  end
end
