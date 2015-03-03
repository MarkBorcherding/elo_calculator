class Club < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :memberships
  has_many :members, through: :memberships, class_name: 'Player'
end

