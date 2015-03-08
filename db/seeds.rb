# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.delete_all
Game.delete_all
Club.delete_all

5.times do
  Club.create! name: Faker::Company.name
end

20.times do
  Player.create! name: Faker::Name.name, rating: 1000
end

player_ids = Player.pluck(:id)

500.times do
  GameCreator.new(player_ids.sample, player_ids.sample).save
end
