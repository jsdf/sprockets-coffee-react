source "http://rubygems.org"

# Declare your gem's dependencies in sprockets-coffee-react.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

sprockets_version = (ENV['SPROCKETS_VERSION'] && ENV['SPROCKETS_VERSION'].strip)

if sprockets_version == '3'
  gem 'rails', '~> 4.2'
  gem 'sprockets', '~> 3.5'
  gem 'sprockets-rails', '~> 3'
elsif sprockets_version == '2'
  gem 'rails', '~> 3.2'
  gem 'sprockets', '~> 2'
else
  gem 'rails'
  gem 'sprockets'
end

gem 'coffee-rails'
gem 'jquery-rails'
gem 'react-rails'
gem 'sqlite3'
# gem 'therubyracer'
