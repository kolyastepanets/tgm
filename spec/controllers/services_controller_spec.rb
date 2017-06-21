require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  sign_in_user

  let(:services) { create_list(:service, 5, classification: "electrician") }

  describe 'GET #index' do
    before { get :index, params: {classification: "electrician"}, xhr: true }

    it 'has array of services' do
      expect(assigns(:services)).to match_array(services)
    end

    it 'render index' do
      expect(response).to render_template :index
    end
  end
end
