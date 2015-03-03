require 'rails_helper'

describe "creating a new game" do
  let!(:club) { Club.create! name: 'some club' }
  let!(:player1) { Player.create! name: 'player 1' }
  let!(:player2) { Player.create! name: 'player 2' }

  let(:won_rating) { 25 }
  let(:lost_rating) { -25 }
  let(:starting_rating) { 0 }

  let(:last_game) { Game.last }

  context 'valid game' do
    it 'creates new game' do
      visit new_club_game_path(club.id)

      select player1.name, from: :game_winner_id
      select player2.name, from: :game_loser_id

      click_button 'Update Ratings'

      player1.reload
      player2.reload

      expect(page).to have_content('Game created')
      expect(find('h3')).to have_content('Game Summary')

      expect(last_game.winner_id).to eq(player1.id)
      expect(last_game.loser_id).to eq(player2.id)

      expect(last_game.winner_rating).to eq(starting_rating)
      expect(last_game.loser_rating).to eq(starting_rating)
    end
  end

  context 'winner and loser are same' do
    it 'does not create new game' do
      visit new_club_game_path(club.id)

      select player1.name, from: :game_winner_id
      select player1.name, from: :game_loser_id

      click_button 'Update Ratings'

      expect(page).to have_content('Winner and loser cannot be same player')

      expect(Game.last).to be_nil
    end
  end
end
