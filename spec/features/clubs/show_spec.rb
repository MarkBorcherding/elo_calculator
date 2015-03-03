require 'rails_helper'

describe 'club homepage' do
  let(:club_name) { 'Some club' }
  let!(:club) { Club.create!(name: club_name) }

  let!(:player) { Player.create!(name: player_name, rating: 1000) }
  let(:player_name) { 'Player one' }

  let!(:club_membership) { Membership.create!(player_id: player.id, club_id: club.id) }

  it 'shows club name' do
    visit club_path(club.id)
    expect(page).to have_content(club_name)
  end

  it 'shows a list of its members' do
    visit club_path(club.id)
    expect(page).to have_content('Players')
    expect(page).to have_content(player_name)
  end
end
