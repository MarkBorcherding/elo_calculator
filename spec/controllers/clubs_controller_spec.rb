require 'rails_helper'

describe ClubsController do
  describe '#index' do
    let(:clubs) { double 'clubs' }

    before do
      allow(Club).to receive(:all) { clubs }
    end

    it 'gets all clubs' do
      get :index
      expect(assigns(:clubs)).to eq(clubs)
    end
  end

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

  describe '#show' do
    let(:club) { double 'club' }
    let(:club_id) { "5" }

    before do
      allow(Club).to receive(:find).with(club_id) { club }
    end

    it 'gets club' do
      get :show, { id: club_id }
      expect(assigns(:club)).to eq(club)
    end
  end
end
