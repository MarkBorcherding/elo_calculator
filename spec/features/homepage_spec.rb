require 'rails_helper'

describe 'home page' do
  let!(:club1) { Club.create! name: 'club one' }
  let!(:club2) { Club.create! name: 'club two' }
  let!(:club3) { Club.create! name: 'club three' }

  it 'shows clubs' do
    visit root_path

    expect(page).to have_content('Clubs')

    expect(page).to have_content(club1.name)
    expect(page).to have_content(club2.name)
    expect(page).to have_content(club3.name)
  end
end
