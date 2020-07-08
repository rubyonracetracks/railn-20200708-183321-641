#!/bin/bash

# BEGIN: changing the Gemfile
STR1="gem 'gemsurance'"
STR2="# $STR1"
sed -i.bak "s|$STR2|$STR1|g" Gemfile
rm Gemfile.bak
docker-compose run --rm web bundle install --quiet
# END: changing the Gemfile

docker-compose run --rm web bash docker-gemsurance.sh

# BEGIN: changing the Gemfile back
sed -i.bak "s|$STR1|$STR2|g" Gemfile
rm Gemfile.bak
docker-compose run --rm web bundle install --quiet
# END: changing the Gemfile back
