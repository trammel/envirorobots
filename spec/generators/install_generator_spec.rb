# frozen_string_literal: true

require 'rails_helper'
require 'ammeter/init'
require_relative '../../lib/generators/envirorobots/install/install_generator'
require 'fileutils'
# rubocop:disable Metrics/BlockLength
module Envirorobots
  RSpec.describe Envirorobots::Generators::InstallGenerator, type: :generator do
    destination File.expand_path('../../tmp', __dir__)

    before do
      prepare_destination
      remove_existing_robots
      write_empty_routes
    end

    [
      'config/envirorobots/development.robots.txt',
      'config/envirorobots/production.robots.txt'
    ].each do |file_name|
      it "should always create #{file_name}" do
        run_generator
        expect(file(file_name)).to exist
      end

      it 'should write default data' do
        run_generator
        expect(file(file_name)).to contain('See http://www.robotstxt.org/robotstxt.html')
      end
    end

    it 'should copy public/robots.txt' do
      write_public_robots_txt 'another test'
      run_generator
      expect(File.join(Rails.root, 'config', 'envirorobots', 'production.robots.txt')).to contain('another test')
    end

    it 'should always remove public/robots.txt' do
      run_generator
      expect(File.join(Rails.root, 'public', 'robots.txt')).to_not exist
    end

    it 'should add a route to routes.rb' do
      run_generator
      expect(file('config/routes.rb')).to contain("mount Envirorobots::Engine => '/'")
    end

    def write_public_robots_txt(data)
      full_name = File.join(Rails.root, 'public', 'robots.txt')
      FileUtils.mkdir_p File.dirname(full_name)
      File.open(full_name, 'w') { |f| f.write(data) }
    end

    def remove_existing_robots
      ['development.robots.txt', 'production.robots.txt'].each do |filename|
        FileUtils.rm_f File.join(Rails.root, 'config', 'envirorobots', filename)
      end
      FileUtils.rm_f File.join(Rails.root, 'public', 'robots.txt')
    end

    def write_empty_routes
      full_name = file('config/routes.rb')
      FileUtils.mkdir_p File.dirname(full_name)
      data = "
Rails.application.routes.draw do
  mount Envirorobots::Engine => '/'
end
"

      File.open(full_name, 'w') { |f| f.write(data) }
    end
  end
end
# rubocop:enable Metrics/BlockLength
