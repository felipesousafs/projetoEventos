source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


gem 'nested_scaffold'

# A gem to automate using jQuery with Rails
gem 'jquery-rails'
# Official Sass port of Bootstrap 2 and 3. http://getbootstrap.com/css/#sass
gem 'bootstrap-sass', '~> 3.3.7'
# the font-awesome font bundled as an asset for the rails asset pipeline http://fortawesome.github.com/Font-Awesome/
gem 'font-awesome-rails'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup. http://blog.plataformatec.com.br/tag/…
gem 'simple_form'
# Flexible authentication solution for Rails with Warden. http://blog.plataformatec.com.br/tag/devise/
gem 'devise'
# The authorization Gem for Ruby on Rails.
gem 'cancancan', '~> 2.0'
# Role management library with resource scoping http://rolifycommunity.github.com/rolify/
gem 'rolify'
# Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms http://github.com/nathanvda/cocoon
gem 'cocoon'
# Integration of RubyMoney - Money with Rails
gem 'money-rails', '~>1'
# Integrate Select2 javascript library with Rails asset pipeline https://github.com/argerim/select2-rails
gem 'select2-rails'
gem 'chosen-rails'
# Add pagination for active record relation
gem 'kaminari'
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'

# IONIC Icons
gem 'font-ionicons-rails'

# Gem para uso das Tags
gem 'acts-as-taggable-on', '~> 6.0'

# FIX BUG IN WINDOWS
gem 'execjs'
gem 'coffee-script-source', '1.8.0'

# Working with datetime
gem 'momentjs-rails', '>= 2.9.0'