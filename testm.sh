#!/bin/bash

# NOTE: The bundle install and database migration are skipped here.
# It is assumed that you already completed these steps, which are
# covered in the build.sh script.

# This script tests the models only.

echo '---------------------------------'
echo 'bundle exec rake test test/models'
docker-compose run --rm web bundle exec rake test test/models
