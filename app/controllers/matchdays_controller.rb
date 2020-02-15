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
    @sports_grounds = SportsGround.all
  end

  def create
    @matchday = Matchday.new(matchday_params)
    sports_ground_id = params[:sports_ground_id].to_i
    sports_ground = SportsGround.find(sports_ground_id)
    @matchday.sports_ground = sports_ground
    @matchday.user = current_user
    @matchday.save!

    redirect_to matchday_path(@matchday)
  end

  private

  def matchday_params
    # params.require(:matchday).permit(:authenticity_token, :user, :sport_type, :date, :red_score, :blue_score, :mode, :sports_ground, :sports_ground_id)
    params.require(:matchday).permit!
  end
end
