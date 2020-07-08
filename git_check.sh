#!/bin/bash

# Run this script before entering "git add" and "git commit".

bash test_app.sh

bin/dcop
bin/drbp

echo '----------'
echo 'git status'
git status
