module HerokuScaleScheduler
  class Railtie < Rails::Railtie
    rake_tasks { load 'heroku_scale_scheduler/tasks/heroku_scale_scheduler.rake' }
  end
end
