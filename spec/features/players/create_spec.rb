require 'rails_helper'

describe 'Adding a player' do
  let(:some_name) { 'Unique Name' }
  let(:a_name) { 'Player Name' }
  let(:default_rating) { 1000 }
  let(:player) { Player.create!(name: a_name, rating: default_rating) }

  describe 'adding a player should take you to your profile' do
    it 'should give you the option to join a club' do
      visit root_path
      click_link 'Add Player'
      fill_in 'player_name', with: some_name
      click_button 'Add Player'
    end
  end

  describe 'joining a club', pending: true do
    let(:club) { Club.create!(name: 'Cool Club') }
    it 'should let the player select a club to compete in' do
      visit player_path(player.id)
      expect(page).to have_content 'Join a club'
      select club.name, from: :membership_club_id
      click_button 'Join Club'
      exepect(player.clubs).to include(club)
    end
  end
end
