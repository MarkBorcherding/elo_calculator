require 'rails_helper'

describe HomepageController do
  describe '#show' do
    let(:clubs) { double 'clubs' }

    before do
      allow(Club).to receive(:all) { clubs }
    end

    it 'gets clubs' do
      get :show
      expect(assigns(:clubs)).to eq(clubs)
    end
  end
end
