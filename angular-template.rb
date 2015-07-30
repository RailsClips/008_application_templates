gem 'angularjs-rails'
gem 'typescript-rails'
gem 'pry-rails'
gem 'thin'
gem 'haml-rails'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'
gem 'simple_form'
gem 'newrelic_rpm'
gem 'dotenv'
gem 'devise'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'capistrano-rails'
  gem 'quiet_assets'
  gem 'pessimize'
end


after_bundle do
  generate "rspec:install"
  generate "foundation:install"
  generate "simple_form:install"
  generate "devise:install"
  generate "devise user"

  generate :controller, "welcome index about"

  route "root to: 'welcome#index'"

  rake "db:migrate"

  environment 'config.action_mailer.default_url_options = {host: "http://localhost:3000"}', env: 'development'

  run "pessimize -c patch"

  git :init
  git add: '.'
  git commit: "-m 'Initial Rails'"
end
