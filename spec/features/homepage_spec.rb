require 'rails_helper'

describe 'home page' do
  it 'contains a link to add a club' do
    visit root_path
    expect(find('.top-bar-section')).to have_content('Add Club')
  end

  it 'lists clubs' do
    visit root_path
    expect(page).to have_content('Clubs')
  end
end
