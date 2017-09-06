require 'rails_helper'

module Envirorobots
  RSpec.describe RobotsController, type: :controller do
    routes { Envirorobots::Engine.routes }

    describe 'show' do
      before do
        get :show
      end

      it 'should successfully call get on the controller' do
        expect(response).to have_http_status(:ok)
      end

      it 'should render config/envirorobots/test.robots.txt' do
        expect(response.body).to eq("hi there\n")
      end

      it 'should render text/plain' do
        expect(response.headers['Content-Type']).to eq 'text/plain'
      end
    end
  end
end
