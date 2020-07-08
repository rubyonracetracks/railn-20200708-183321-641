#!/bin/bash

set -e

bash annotate.sh

docker-compose run --rm web bash docker-tree.sh
