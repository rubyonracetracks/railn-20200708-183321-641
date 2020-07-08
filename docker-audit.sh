#!/bin/bash
set -e

# NOTE: This script is to be used ONLY in a Docker container or in Travis.

echo '-------------------------------'
echo 'bundle exec bundle-audit update'
bundle exec bundle-audit update

echo '------------------------'
echo 'bundle exec bundle-audit'
bundle exec bundle-audit
