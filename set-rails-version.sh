#!/bin/bash

ROOT_DIR=$(git rev-parse --show-toplevel)

export RAILS_VERSION=${1:-3}

rm -fv $ROOT_DIR/Gemfile.lock
bundle install