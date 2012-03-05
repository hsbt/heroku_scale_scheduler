namespace :heroku do
  namespace :scale do
    desc 'scaling heroku dynos'
    task :dynos do
      HerokuScaleScheduler::Client.new(:dynos).run
    end

    desc 'scaling heroku workers'
    task :workers do
      HerokuScaleScheduler::Client.new(:workers).run
    end
  end
end
