#!/bin/bash

echo '**********************'
echo 'Entering rails console'
docker-compose run --rm web bundle exec rails runner "eval(File.read 'admin_create.rb')"
