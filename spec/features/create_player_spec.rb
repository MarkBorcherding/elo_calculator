require 'rails_helper'

describe 'Adding a player' do
  let(:player_name) { 'Unique Name' }

  describe 'adding a player should take you to your profile' do
    xit 'should give you the option to join a club' do
      visit root_path
      click_link 'Add Player'
      fill_in 'player_name', with: player_name
      click_button 'Add Player'

      expect(page).to have_content 'Join a club'
    end
  end
end
