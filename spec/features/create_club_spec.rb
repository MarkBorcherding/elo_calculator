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
      
    end

    it 'only creates club if name is not taken' do

    end
    
  end
end
