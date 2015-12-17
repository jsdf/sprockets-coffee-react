source "http://rubygems.org"

# Declare your gem's dependencies in sprockets-coffee-react.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.


v = (ENV['RAILS_VERSION'] && ENV['RAILS_VERSION'].strip || '3')

rails_version =
  if v == '3'
    '~> 3.2'
  elsif v == 'v'
    '~> 4.2'
  else
    v
  end

gem 'rails', rails_version
gem 'coffee-rails'
gem 'jquery-rails'
gem 'react-rails', '~> 1.5.0', github: 'reactjs/react-rails'
gem 'sqlite3'
# gem 'therubyracer'
gem 'sprockets', '~> 3'
