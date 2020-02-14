class MatchdaysController < ApplicationController
  def index
    @matchdays = Matchday.all
  end

  def show
    @matchday = Matchday.find(params[:id])
    @spots = @matchday.spots
  end

  def new
    @matchday = Matchday.new
  end

  def create
    @matchday = Matchday.new(matchday_params)
    @matchday.save

    redirect_to matchday_path(@matchday)
  end

  private

  def matchday_params
    params.require(:matchday).permit(:user, :sport_type, :date, :red_score, :blue_score, :mode, :sports_ground)
  end
end
