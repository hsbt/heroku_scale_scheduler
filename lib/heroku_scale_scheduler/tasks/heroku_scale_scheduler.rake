client = HerokuScaleScheduler::Client.new
namespace :heroku do
  namespace :scale do
    desc 'scaling heroku dynos'
    task :dynos do
      client.run(:dynos)
    end

    desc 'scaling heroku workers'
    task :workers do
      client.run(:workers)
    end

    desc 'scaling heroku process'
    task :ps do
      client.run
    end
  end
end
