class ClubsController < ApplicationController
  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to root_path, notice: 'Club created'
    else
      flash.now[:alert] = 'Club failed to save'
      render :new
    end
  end

  private

  def club_params
    params.require(:club).permit(:name)
  end
end
