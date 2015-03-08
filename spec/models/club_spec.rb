require 'rails_helper'

describe Club do
  it { should validate_presence_of(:name) }
  it { should have_many(:games) }
end
