#!/bin/bash
set -e

echo '++++++++++++++++'
echo 'BEGIN: outlining'
echo '++++++++++++++++'

bash outline-short.sh

STR1="gem 'railroady'"
STR2="# $STR1"
STR3="gem 'rails-erd'"
STR4="# $STR3"
STR5="gem 'ruby-graphviz'"
STR6="# $STR5"

# BEGIN: changing the Gemfile
sed -i.bak "s|$STR2|$STR1|g" Gemfile
sed -i.bak "s|$STR4|$STR3|g" Gemfile
sed -i.bak "s|$STR6|$STR5|g" Gemfile
rm Gemfile.bak
docker-compose run --rm web bundle install --quiet
# END: changing the Gemfile

docker-compose run --rm web bash docker-outline-long.sh

# BEGIN: changing the Gemfile back
sed -i.bak "s|$STR1|$STR2|g" Gemfile
sed -i.bak "s|$STR3|$STR4|g" Gemfile
sed -i.bak "s|$STR5|$STR6|g" Gemfile
rm Gemfile.bak
docker-compose run --rm web bundle install --quiet
# END: changing the Gemfile back

echo '+++++++++++++++++++'
echo 'FINISHED: outlining'
echo '+++++++++++++++++++'
