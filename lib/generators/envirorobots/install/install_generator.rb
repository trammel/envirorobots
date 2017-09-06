require 'fileutils'

module Envirorobots
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def install
        create_destination_folder
        move_existing_robots
        provide_new_robots
        install_route
      end

      private

      def create_destination_folder
        FileUtils.mkdir_p File.join(Rails.root, 'config', 'envirorobots')
      end

      def move_existing_robots
        source = File.join(Rails.root, 'public', 'robots.txt')
        destination = File.join(Rails.root, 'config', 'envirorobots', 'production.robots.txt')
        return unless File.exist? source
        FileUtils.move source, destination
      end

      def provide_new_robots
        ['development.robots.txt', 'production.robots.txt'].each do |filename|
          puts "Installing #{filename}"
          next if File.exist? File.join(Rails.root, 'config', 'envirorobots', filename)
          copy_file filename, "config/envirorobots/#{filename}"
        end
      end

      def install_route
        route "mount Envirorobots::Engine => '/'"
      end
    end
  end
end
