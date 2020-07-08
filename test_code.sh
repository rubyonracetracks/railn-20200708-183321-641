#!/bin/bash

# This script runs the app through code metrics.
# Violations will not stop the app from passing but will be flagged here.

bin/dcop
bin/drbp
bash sandi.sh
bash audit.sh
bash brakeman.sh
bash gemsurance.sh
