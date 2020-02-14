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
end
