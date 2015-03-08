require 'rails_helper'

describe 'joining a club' do
  let(:last_membership) { Membership.last }

  let!(:club) { Club.create! name: 'club one' }

  let!(:player1) { Player.create! name: 'person 1' }
  let!(:player2) { Player.create! name: 'person 2' }

  it 'joins club' do
    visit new_membership_path

    select club.name, from: :membership_club_id
    select player1.name, from: :membership_player_id

    click_button 'Join Club'

    expect(page).to have_content('Joined Club')
    expect(last_membership.club_id).to eq(club.id)
    expect(last_membership.player_id).to eq(player1.id)
  end
end
