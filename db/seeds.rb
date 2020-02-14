require 'faker'
# 1 - cleaning database:

puts 'cleaning database...'

def delete(db_model)
  puts "deleting #{db_model.to_s.downcase}s..."
  db_model.destroy_all
end

db_models = [Goal, Spot, Matchday, User, SportsGround]

db_models.each do |db_model|
  unless db_model.all.empty?
    delete(db_model)
  end
end
puts 'done!'

puts 'creating seeds...'
# 1 - creating 10 users
10.times do
  User.create(email: Faker::Internet.email.split('@')[0] + '@example.com', password: '123456', username: Faker::Creature::Animal.name )
end
puts 'created 10 users!'

# 2 - creating 5 sports grounds
5.times do
  SportsGround.create(name: Faker::TvShows::FamilyGuy.location, address: Faker::Address.full_address)
end
puts 'created 5 sports grounds!'

# 3 - creating 3 matchdays
Matchday.create(user: User.first, sport_type: 'soccer', date: Date.today + 10, mode: '3 on 3', sports_ground: SportsGround.first)
Matchday.create(user: User.all[User.first.id + 1], sport_type: 'basketball', date: Date.today + 15, mode: '5 on 5', sports_ground: SportsGround.all[SportsGround.first.id + 1])
Matchday.create(user: User.all[User.first.id + 2], sport_type: 'table tennis', date: Date.today + 3, mode: '1 on 1', sports_ground: SportsGround.all[SportsGround.first.id + 2])
puts 'created 3 matchdays!'

# 4 - create 3 spots for team_red and assign them to the matchday in db
spot_1_red = Spot.create(user: User.first, matchday: Matchday.first, team_red: true, team_blue: false)
spot_2_red = Spot.create(user: User.all[User.first.id + 1], matchday: Matchday.first, team_red: true, team_blue: false)
spot_3_red = Spot.create(user: User.all[User.first.id + 2], matchday: Matchday.first, team_red: true, team_blue: false)
puts 'created 3 spots for team red'

# 4 - create 3 spots for team_red and assign them to the matchday in db
spot_1_red = Spot.create(user: User.all[User.first.id + 3], matchday: Matchday.first, team_red: false, team_blue: true)
spot_2_red = Spot.create(user: User.all[User.first.id + 4], matchday: Matchday.first, team_red: false, team_blue: true)
spot_3_red = Spot.create(user: User.all[User.first.id + 5], matchday: Matchday.first, team_red: false, team_blue: true)
puts 'created 3 spots for team blue'



