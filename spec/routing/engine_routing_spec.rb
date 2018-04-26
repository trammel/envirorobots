# frozen_string_literal: true

require 'rails_helper'

module Envirorobots
  RSpec.describe Envirorobots::RobotsController, type: :routing do
    routes { Envirorobots::Engine.routes }

    it 'routes to the robots.txt' do
      expect(get: robots_path).to route_to(controller: 'envirorobots/robots', action: 'show')
    end
  end
end
