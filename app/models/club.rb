class Club < ActiveRecord::Base
  validates_presence_of :name

  has_many :games
  has_many :memberships
  has_many :players, through: :memberships

  def ranked_players
    players.by_rating
  end
end
