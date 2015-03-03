class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def new
  end

  def create
    @club = Club.create(club_params)

    if @club.save
      redirect_to @club, notice: 'Club successfully created'
    else
      flash.now[:alert] = @club.errors.full_messages.join('. ')
      render :new
    end
  end

  def show
    @club = Club.find(params[:id])
  end

  private

  def club_params
    params.require(:club).permit(:name)
  end
end
