require 'rails_helper'

describe "creating a new club" do
  context 'valid club' do
    let(:club_name) { 'Club Name' }

    it 'creates new club' do
      visit new_club_path

      fill_in :club_name, with: club_name

      click_button 'Create'

      expect(Club.last.name).to eq(club_name)
    end
  end
end
