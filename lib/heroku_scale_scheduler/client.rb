require 'heroku/client'

module HerokuScaleScheduler
  class Client
    def config
      path = Rails.root.join('config', 'heroku_ps.yml')
      @config ||= File.exists?(path) ? YAML.load_file(path) : {}
    end

    def run(type = :ps)
      client = Heroku::Client.new(*Heroku::Auth.read_credentials)
      run_at = (Time.now.strftime('%H%M').to_i / 10) * 10

      config.keys.each do |app|
        if type != :ps && qty = config[app][type.to_s][run_at]
          case type
          when :dynos then client.set_dynos(app, qty)
          when :workers then client.set_workers(app, qty)
          end
        else
          config[app].keys.each do |ps|
            if qty = config[app][ps][run_at]
              client.ps_scale(app, :type => ps, :qty => qty)
            end
          end
        end
      end
    end
  end
end
