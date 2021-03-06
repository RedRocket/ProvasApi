source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'acts_as_list'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'rails_12factor', group: :production

gem 'net-ssh'
gem 'mini_magick'
gem "fog"
gem "fog-aws"
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-base64'

gem "mime-types"
gem 'rack-cors', :require => 'rack/cors'

gem 'rails-assets-sweetalert', source: 'https://rails-assets.org'
gem 'sweet-alert-confirm'

gem 'one_signal'
gem 'faker'
gem 'delayed_job_active_record'
gem 'ropencv'
gem 'rollbar', '~>2.11.3'
gem 'daemons'
gem 'seed_dump'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet'
  gem 'byebug'
end

gem 'figaro'
gem 'puma'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'capistrano'
  gem 'capistrano3-delayed-job', '~> 1.0'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
  gem 'capistrano-rails-console', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

