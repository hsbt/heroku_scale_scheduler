require 'heroku/client'

client = Heroku::Client.new(*Heroku::Auth.read_credentials)
config = if File.exists? Rails.root.join('config', 'heroku_ps.yml')
           YAML.load(Rails.root.join('config', 'heroku_ps.yml'))
         else
           {}
         end

namespace :heroku do
  namespace :scale do
    desc 'scaling heroku dynos'
    task :dynos do
      qty = config['dynos'][Time.now.strftime('%H%M')]
      client.set_dynos(config['app'], qty) if qty
    end

    desc 'scaling heroku workers'
    task :workers do
      qty = config['workers'][Time.now.strftime('%H%M')]
      client.set_workers(config['app'], qty) if qty
    end
  end
end
