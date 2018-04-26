# frozen_string_literal: true

module Envirorobots
  class Engine < ::Rails::Engine
    isolate_namespace Envirorobots
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
