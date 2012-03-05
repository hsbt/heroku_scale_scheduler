require 'heroku/client'

module HerokuScaleScheduler
  class Client
    def run(type = :ps)
      client = Heroku::Client.new(*Heroku::Auth.read_credentials)
      config = HerokuScaleScheduler::Config.read_config
      run_at = (Time.now.strftime('%H%M').to_i / 10) * 10

      if type != :ps && qty = config[type.to_s][run_at]
        case type
        when :dynos then client.set_dynos(config['app'], qty)
        when :workers then client.set_workers(config['app'], qty)
        end
      else
        config.keys.each do |process|
          if qty = config[process][run_at]
            client.ps_scale(config['app'], :type => process, :qty => qty)
          end
        end
      end
    end
  end
end
