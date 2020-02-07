class MatchdaysController < ApplicationController
  def index
    @matchdays = Matchday.all
  end
end
