require 'rails_helper'

describe Club do
  it { should have_many(:memberships) }
  it { should have_many(:members).through(:memberships).class_name('Game') }
end
