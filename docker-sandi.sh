#!/bin/bash

set -e

# Checks for compliance with Sandi Metz' four rules
echo '-----------------------'
echo 'bundle exec sandi_meter'
bundle exec sandi_meter
