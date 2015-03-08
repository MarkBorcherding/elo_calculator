require 'rails_helper'

describe Membership do
  it { should belong_to(:club) }
  it { should belong_to(:player) }
  it { should validate_presence_of(:club_id) }
  it { should validate_presence_of(:player_id) }
  #it { should validate_uniqueness_of(:club_id).scoped_to(:player_id) }
end
