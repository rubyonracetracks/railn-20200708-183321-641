#!/bin/bash
set -e

exec_pg_setup () {
  FILENAME=$1
  if [[ ! -f $FILENAME ]]
  then
    echo # Placeholder command to avoid error before the POSTGRES section is uncommented
    #POSTGRES#bash pg_setup.sh
  fi
}

exec_pg_setup 'config/database.yml'
exec_pg_setup '.env/development/database'
exec_pg_setup 'init.sql'

bin/dbuild
bash all.sh
bash info.sh
