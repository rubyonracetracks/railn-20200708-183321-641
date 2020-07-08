#!/bin/bash
set -e

# NOTE: This script is to be used ONLY in a Docker container or in Travis.

echo '-----------------------------------------'
echo 'bundle exec annotate -r --models -a -k -i'
bundle exec annotate -r --models -a -k -i
