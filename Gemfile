source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # RSpec
  gem 'factory_bot_rails'
  gem 'rspec-rails'

  # Code analyze
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rails_best_practices'
  gem 'rubocop-rspec'
  gem 'rspec_junit_formatter'

  # Debugger
  gem 'pry-byebug'
  gem 'pry-rails'

  # Provides a better error page for Rails
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 0.8.0'

  # 自動デプロイ
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :production, :staging do
  gem 'unicorn'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # webpacker立ち上げ用
  gem 'foreman'

  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

# テスト環境のみ
group :test do
  gem 'capybara'
  gem 'webdrivers'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# 環境変数
gem 'dotenv-rails'

# 外部APIを叩く
gem 'httpclient'

# ログイン・新規登録機能
gem 'sorcery'
gem 'jwt'

# カウント機能
gem 'counter_culture'

# 日本語化
gem 'rails-i18n'

# N+1を検知
gem 'bullet'

gem 'mimemagic', '~> 0.3.10'
gem 'sassc', '2.4.0'
