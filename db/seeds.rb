# 1 - cleaning database:

puts 'Cleaning database...'

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




