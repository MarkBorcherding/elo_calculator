class Club < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :memberships
  has_many :players, through: :memberships
end
