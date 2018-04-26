# frozen_string_literal: true

module Envirorobots
  class RobotsController < ActionController::Base
    def show
      send_file(
        File.join(Rails.root, 'config', 'envirorobots', "#{Rails.env}.robots.txt"),
        filename: 'robots.txt',
        type: 'text/plain',
        disposition: 'inline'
      )
    end
  end
end
