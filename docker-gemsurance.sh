#!/bin/bash
set -e

# NOTE: This script is to be used ONLY in a Docker container or in Travis.

# Checks for outdated and insecure gems
echo '----------------------'
echo 'bundle exec gemsurance'
bundle exec gemsurance
wait
mv gemsurance_report.html log/gemsurance_report.html
echo 'The Gemsurance Report is at log/gemsurance_report.html .'
