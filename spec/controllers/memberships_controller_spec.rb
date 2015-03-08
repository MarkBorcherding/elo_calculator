require 'rails_helper'

describe MembershipsController do
  describe '#new' do
    let(:membership) { double 'membership' }

    before do
      allow(Membership).to receive(:new) { membership }
    end

    it 'assigns membership' do
      get :new
      expect(assigns(:membership)).to eq(membership)
    end
  end

  describe '#create' do
    let(:membership) { double 'membership' }
    let(:player_id) { "5" }
    let(:club_id) { "3" }
    let(:membership_params) { { membership: { club_id: club_id, player_id: player_id } } }

    before do
      allow(Membership).to receive(:new).with(membership_params[:membership]) { membership }
      allow(membership).to receive(:save) { saved }
    end

    context 'valid' do
      let(:saved) { true }

      it 'creates new membership' do
        post :create, membership_params
        expect(response).to redirect_to(root_path)
      end
    end

    context 'invalid' do
      let(:saved) { false }

      it 'does not create membership' do
        post :create, membership_params
        expect(response).to render_template(:new)
      end
    end
  end
end
