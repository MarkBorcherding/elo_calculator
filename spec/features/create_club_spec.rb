require 'rails_helper'

describe 'Creating a club' do
  context 'getting to the add club page' do
    it 'lets you click the link from the homepage' do
      visit root_path
      click_link 'Add Club'
      expect(page.current_path).to eq new_club_path
    end
  end
  context 'Adding club details' do
    it 'creates a new club' do
      visit new_club_path
      fill_in 'club_name', with: 'Test'
      click_button 'Create Club'
      expect(page).to have_content('Test')
    end
  end
end
