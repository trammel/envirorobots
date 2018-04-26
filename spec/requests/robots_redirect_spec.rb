# frozen_string_literal: true

require 'rails_helper'

module Envirorobots
  RSpec.describe RobotsController, type: :request do
    describe '/robots' do
      it 'should redirect to /robots.txt' do
        get '/robots'
        expect(response).to redirect_to('/robots.txt')
      end
    end
  end
end
