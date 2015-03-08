require 'rails_helper'

describe Club do
  it { should validate_presence_of(:name) }
  it { should have_many(:games) }
  it { should have_many(:memberships) }
  it { should have_many(:players).through(:memberships) }
end
