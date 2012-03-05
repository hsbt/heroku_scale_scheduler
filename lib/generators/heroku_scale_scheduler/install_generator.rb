module HerokuScaleScheduler
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies Heroku Scheduler configuration file to your config directory.
DESC

      def copy_config_file
        copy_file 'heroku_ps.yml', 'config/heroku_ps.yml'
      end
    end
  end
end
