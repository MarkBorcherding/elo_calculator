require 'rails_helper'

describe PlayersController do
  describe '#create' do
    let(:taken_name) { 'Taken' }
    let(:good_name) { 'Good Name' }
    let(:default_rating) { 1000 } 
    let(:params) { { player: { name: good_name, rating: default_rating } } }

    context 'validations' do
      before do
        Player.create!(name: taken_name, rating: 1000)
      end

      it 'be a unique name' do
        player = Player.new(name: taken_name, rating: 1000)
        expect(player).to_not be_valid
      end
    end

    context 'successfully creates player' do
      it 'redirects them to their profile page' do
        post :create, params
        expect(flash[:notice]).to eq('Player created')
        expect(response).to redirect_to(assigns(:player))
      end
    end

    context 'unsuccessfully creates player' do
      let(:params) { { player: { name: taken_name, rating: default_rating } } }
      
      before do
        Player.create!(name: taken_name, rating: 1000)
      end

      it 'stays on the new page and shows an error' do
        post :create, params
        expect(flash[:alert]).to eq('Please choose another name')
        expect(response).to render_template(:new)
      end
    end
    

  end

  describe '#show' do
    let(:player) { double 'player' }
    let(:params) { { id: "5" } }

    before do
      allow(Player).to receive(:find).with(params[:id]) { player }
    end

    it 'assigns the player' do
      get :show, params
      expect(assigns(:player)).to eq(player)
    end
  end
end
