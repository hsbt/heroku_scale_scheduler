namespace :heroku do
  namespace :scale do
    desc 'scaling heroku dynos'
    task :dynos do
      HerokuScaleScheduler::Client.new.run(:dynos)
    end

    desc 'scaling heroku workers'
    task :workers do
      HerokuScaleScheduler::Client.new.run(:workers)
    end

    desc 'scaling heroku process'
    task :process do
      HerokuScaleScheduler::Client.new.run
    end
  end
end
