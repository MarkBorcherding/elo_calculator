class Membership < ActiveRecord::Base
  belongs_to :club
  belongs_to :player

  validates_presence_of :club_id, :player_id

  validates_uniqueness_of :club_id, scope: :player_id
end
