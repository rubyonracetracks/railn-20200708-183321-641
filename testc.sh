#!/bin/bash

# NOTE: The bundle install and database migration are skipped here.
# It is assumed that you already completed these steps, which are
# covered in the build.sh script.

# This script tests the controllers only.

echo '---------------------------------'
echo 'bundle exec test test/controllers'
docker-compose run --rm web bundle exec test test/controllers
