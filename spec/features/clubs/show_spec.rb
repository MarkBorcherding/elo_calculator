require 'rails_helper'

describe 'club page' do
  let!(:club) { Club.create! name: 'club one' }

  let!(:player1) { Player.create! name: 'player 1', rating: 500 }
  let!(:player2) { Player.create! name: 'player 2', rating: 600 }

  let!(:game1) { Game.create! winner_id: player1.id, loser_id: player2.id, winner_rating: 400, loser_rating: 500, club_id: club.id }
  let!(:game2) { Game.create! winner_id: player2.id, loser_id: player1.id, winner_rating: 500, loser_rating: 400, club_id: club.id }

  it 'shows clubs' do
    visit club_path(club.id)

    expect(page).to have_content(club.name)
  end

  it 'shows player ratings', pending: true do
    visit club_path(club.id)

    within "#player-#{player1.id}" do
      expect(find('.rank')).to have_content(2)
      expect(find('.name')).to have_content(player1.name)
      expect(find('.rating')).to have_content(player1.rating)
      expect(find('.won-lost')).to have_content("1 / 1")
    end

    within "#player-#{player2.id}" do
      expect(find('.rank')).to have_content(1)
      expect(find('.name')).to have_content(player2.name)
      expect(find('.rating')).to have_content(player2.rating)
      expect(find('.won-lost')).to have_content("1 / 1")
    end
  end

  it 'shows join club button' do
    visit club_path(club.id)
    expect(page).to have_link('Join Club')
  end
end
