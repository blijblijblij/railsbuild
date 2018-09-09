#!/bin/zsh

echo "starting"
echo "---> rake --trace db:migrate first"
RAILS_ENV="${RAILS_ENV}" bundle exec rake --trace db:migrate

echo "rails server via puma"
bundle exec rails server puma -b 0.0.0.0 -p 3000
