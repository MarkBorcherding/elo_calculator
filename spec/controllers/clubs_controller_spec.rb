require 'rails_helper'

describe ClubsController do
  describe '#new' do
    it 'assigns a new club' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    let(:existing_club) { 'Ace' }
    let(:club_name) { 'Test Club' } 
    let(:success_message) { 'Club successfully created' } 
    let(:new_club) { double 'new club' }

    context 'successfully creates a game' do
      let(:params) { { club: { name: club_name } } }
      let(:save_success?) { true }

      it 'notifies you and takes you to the club page' do
        post :create, params
        expect(flash[:notice]).to eq success_message
        expect(response).to redirect_to(assigns(:club))
      end
    end

    context 'failure because club name is taken' do
      let(:params) { { club: { name: existing_club } } }
      let(:full_messages) { [ 'Name has already been taken' ] }

      before do
        Club.create!(name: 'Ace')
      end

      it 'prompts you to choose another name and stays on the same page' do
        post :create, params
        expect(flash[:alert]).to eq(full_messages.join('. '))
        expect(response).to render_template(:new)
      end
    end

    context 'failure because club name is left empty' do
      let(:params) { { club: { name: '' } } }
      let(:full_messages) { [ "Name can't be blank" ] }

      it 'prompts you to choose another name and stays on the same page' do
        post :create, params
        expect(flash[:alert]).to eq(full_messages.join('. '))
        expect(response).to render_template(:new)
      end
      
    end
  end

  describe '#show' do
    let(:club_id) { 'club id' }
    let(:club) { double 'club', id: club_id }

    before do 
      allow(Club).to receive(:find).with(club_id) { club }
    end

    it 'shows the last club created' do
      get :show, id: club_id
      expect(assigns(:club)).to eq(club)
      expect(response).to render_template(:show)
    end
  end
end
