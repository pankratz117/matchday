require 'rails_helper'

RSpec.describe Matchday, type: :model do
  it 'should test that a correct matchday is valid' do
    user = User.create(email: 'user@example.com', password: '123456')
    sports_ground = SportsGround.create(name: 'hells kitchen')
    matchday = Matchday.create(user: user, sports_ground: sports_ground, sport_type: 'soccer', mode: '5 on 5', date: Date.today + 1)
    expect(matchday).to be_valid
  end

  it 'should validate the presence of the mode' do
    user = User.create(email: 'user@example.com', password: '123456')
    sports_ground = SportsGround.create(name: 'hells kitchen')
    matchday = Matchday.create(user: user, sports_ground: sports_ground, sport_type: 'soccer', date: Date.today + 1)
    expect(matchday).not_to be_valid
    expect(matchday.errors.messages[:mode]).to include('can\'t be blank')
  end

  it 'should validate the presence of the sport_type' do
    user = User.create(email: 'user@example.com', password: '123456')
    sports_ground = SportsGround.create(name: 'hells kitchen')
    matchday = Matchday.create(user: user, sports_ground: sports_ground, mode: '5 on 5', date: Date.today + 1)
    expect(matchday).not_to be_valid
    expect(matchday.errors.messages[:sport_type]).to include('can\'t be blank')
  end
end
