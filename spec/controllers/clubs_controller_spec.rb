require 'rails_helper'

describe ClubsController do
  describe '#new' do
    let(:club) { double 'club' }

    before do
      allow(Club).to receive(:new) { club }
    end

    it 'renders new' do
      get :new
      expect(assigns(:club)).to eq(club)
    end
  end

  describe '#create' do
    let(:club) { double 'club' }
    let(:club_params) { { club: { name: 'some club' } } }

    before do
      allow(Club).to receive(:new).with(club_params[:club]) { club }
      allow(club).to receive(:save) { saved }
    end

    context 'valid' do
      let(:saved) { true }

      it 'creates new club' do
        post :create, club_params
        expect(response).to redirect_to(root_path)
      end
    end

    context 'invalid' do
      let(:saved) { false }

      it 'does not create club' do
        post :create, club_params
        expect(response).to render_template(:new)
      end
    end
  end
end
