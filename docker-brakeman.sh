#!/bin/bash
set -e

# NOTE: This script is to be used ONLY in a Docker container or in Travis.

# Checks for security vulnerabilities
# -A: runs all checks
# -q: output the report only; suppress information warnings
# -w2: level 2 warnings (medium and high only)

echo '---------------------------------------'
echo 'bundle exec brakeman -Aq -w2 --no-pager'
bundle exec brakeman -Aq -w2 --no-pager
