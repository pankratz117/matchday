require 'rails_helper'

describe MatchdaysController do
  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper view' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#show' do
    Matchday.destroy_all
    User.destroy_all
    SportsGround.destroy_all
    user = User.create(email: 'foooootballllller@example.com', password: '123456', username: 'theFootballLegend')
    sports_ground = SportsGround.create(name: 'dasStadiooon', address: 'Berlin Kreuzberg')
    matchday = Matchday.create(user: user, sport_type: 'soccer', date: Date.today + 10, mode: '3 on 3', sports_ground: sports_ground)
    it 'should return success response' do
      get :show, params: { id: matchday.id }
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper view' do
      get :show, params: { id: matchday.id }
      expect(response).to render_template(:show)
    end
  end
end
