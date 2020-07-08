#!/bin/bash

# Use this script for upgrading gems.

# If the version of a gem is pinned in the Gemfile, you must update
# the version number specified in that file.

# Do NOT use this script until you have set up this project with the build.sh script.

bin/dupdate

bash git_check.sh

bash gemsurance.sh
