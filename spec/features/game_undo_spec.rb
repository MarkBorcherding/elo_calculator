require 'rails_helper'

RSpec.describe 'undoing a game' do
  let!(:winner) { Player.create! name: 'winner', rating: 1000 }
  let!(:loser) { Player.create! name: 'loser', rating: 1000 }
  let!(:first_game) { Game.create! winner_id: winner.id,
                                   loser_id: loser.id,
                                   winner_rating: winner.rating,
                                   loser_rating: loser.rating}
  let!(:last_game) { Game.create! winner_id: winner.id,
                                   loser_id: loser.id,
                                   winner_rating: winner.rating,
                                   loser_rating: loser.rating}
  context 'will not happen if it is the first game' do
    it 'will not undo a game unless it is the last game' do
      expect(GameDestroyer.new(first_game).undo_game!).to be false
    end

    it 'will happen if game  is the last game' do
      expect(GameDestroyer.new(last_game).undo_game!).to be true
    end
  end

end
