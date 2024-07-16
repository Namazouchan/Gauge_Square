#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Installing dependencies"
bundle install

echo "Precompiling assets"
RAILS_ENV=production bundle exec rake assets:precompile

bundle exec rake assets:clean

echo "Running database migrations"
RAILS_ENV=production bundle exec rake db:migrate
