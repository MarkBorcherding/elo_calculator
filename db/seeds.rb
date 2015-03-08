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
Membership.delete_all

5.times do
  Club.create! name: Faker::Company.name
end

club_ids = Club.pluck(:id)

20.times do
  Player.create! name: Faker::Name.name, rating: 1000
end

player_ids = Player.pluck(:id)

player_ids.each do |player_id|
  clubs_to_join = rand(0..5)

  clubs_joined = []

  clubs_to_join.times do
    club_id = (club_ids - clubs_joined).sample
    Membership.create! club_id: club_id, player_id: player_id
    clubs_joined << club_id
  end
end

500.times do
  GameCreator.new(player_ids.sample, player_ids.sample).save
end
