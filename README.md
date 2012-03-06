# HerokuScaleScheduler

HerokuScaleScheduler is schedule scale of heroku dynos/workers.

## Installation

Add this line to your application's Gemfile:

    gem 'heroku_scale_scheduler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heroku_scale_scheduler

## Usage

1. run the folllow commands
```
$ bundle exec rails g heroku_scale_scheduler:install
```
2. write your scheduling configuration to config/heroku_ps.yml. **Notice: schedule time is must be 10 minutes periods, and write UTC time.**
3. add Heroku scheduler addons.
4. visit your Heroku scheduler dashboard, if you use bomboo stack added follow tasks
<table>
<tr><th>TASK</th><th>FREQUENCY</th></tr>
<tr><td>heroku:scale:dynos</td><td>Every 10 minutes</td></tr>
<tr><td>heroku:scale:workers</td><td>Every 10 minutes</td></tr>
<table>
or use cedar stack
<table>
<tr><th>TASK</th><th>FREQUENCY</th></tr>
<tr><td>heroku:scale:ps</td><td>Every 10 minutes</td></tr>
<table>
5. add your heroku api key to Heroku env. example for
```
$ heroku config:add HEROKU_API_KEY=xxx --app example_app
```
6. push your app for heroku.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
