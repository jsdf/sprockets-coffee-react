#!/bin/bash

ROOT_DIR=$(git rev-parse --show-toplevel)

rm $ROOT_DIR/Gemfile.lock
RAILS_VERSION=3 bundle install --local
RAILS_VERSION=3 bundle exec rake test
rm $ROOT_DIR/Gemfile.lock
RAILS_VERSION=4 bundle install --local
RAILS_VERSION=4 bundle exec rake test