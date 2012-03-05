require 'heroku/client'

module HerokuScaleScheduler
  class Client
    def initialize(type)
      @type = type
    end

    def run
      client = Heroku::Client.new(*Heroku::Auth.read_credentials)
      config = HerokuScaleScheduler::Config.read_config
      run_at = (Time.now.strftime('%H%M').to_i / 10) * 10

      if qty = config[@type.to_s][run_at]
        case @type
        when :dynos then client.set_dynos(config['app'], qty)
        when :workers then client.set_workers(config['app'], qty)
        end
      end
    end
  end
end