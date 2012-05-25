# -*- encoding: utf-8 -*-
require File.expand_path('../lib/heroku_scale_scheduler/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["SHIBATA Hiroshi"]
  gem.email         = ["shibata.hiroshi@gmail.com"]
  gem.description   = "scaling scheduler for heroku dynos/workers"
  gem.summary       = "heroku_scale_scheduler is simple scaling scheduler for heroku dynos/workers."
  gem.homepage      = "https://github.com/hsbt/heroku_scale_scheduler"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "heroku_scale_scheduler"
  gem.require_paths = ["lib"]
  gem.version       = HerokuScaleScheduler::VERSION

  gem.add_runtime_dependency 'heroku', ['>= 2.25.0']
  gem.add_runtime_dependency 'railties', ['>= 3.0']
end
