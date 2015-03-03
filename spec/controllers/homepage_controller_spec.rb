require 'rails_helper'

describe HomepageController do
  describe '#show' do
    let(:clubs) { double 'clubs' }

    before do
      allow(Club).to receive(:all) { clubs }
    end

    it 'shows all the clubs' do
      get :show
      expect(response).to render_template(:show)
      expect(assigns(:clubs)).to eq(clubs)
    end
  end
end
