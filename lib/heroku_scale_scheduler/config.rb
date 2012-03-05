module HerokuScaleScheduler
  class Config
    def self.read_config
      if File.exists? Rails.root.join('config', 'heroku_ps.yml')
        YAML.load(File.read(Rails.root.join('config', 'heroku_ps.yml')))
      else
        {}
      end
    end
  end
end
