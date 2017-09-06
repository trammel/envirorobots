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
        return unless File.exist? File.join(Rails.root, 'public', 'robots.txt')
        FileUtils.mv(
          File.join(Rails.root, 'public', 'robots.txt'),
          File.join(Rails.root, 'config', 'envirorobots', 'production.robots.txt')
        )
      end

      def provide_new_robots
        copy_file('development.robots.txt', 'config/envirorobots/development.robots.txt')
        copy_file('production.robots.txt', 'config/envirorobots/production.robots.txt')
      end

      def install_route
        route "mount Envirorobots::Engine => '/'"
      end
    end
  end
end
