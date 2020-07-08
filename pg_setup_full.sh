#!/bin/bash

DB_ROOT=$1
DB_USERNAME=$2
DB_PASSWORD=$3

replace_string_in_file () {
  STRING1=$1
  STRING2=$2
  FILE_TO_UPDATE=$3
  sed -i "s/$STRING1/$STRING2/g" $FILE_TO_UPDATE
}

delete_between_strings_in_file () {
  STRING1=$1
  STRING2=$2
  FILE_TO_UPDATE=$3
  sed -i -n "/$STRING1/{p; :a; N; /$STRING2/!ba; s/.*\n//}; p" $FILE_TO_UPDATE
}

# Source:
# https://stackoverflow.com/questions/15559359/insert-line-after-first-match-using-sed
insert_line_after_string_in_file () {
  STRING1=$1 # String in file
  STRING2=$2 # Line to insert
  FILE_TO_UPDATE=$3
  sed -i "/$STRING1/a $STRING2" $FILE_TO_UPDATE
}

# Update the Dockerfile to remove SQLite (no longer needed)
echo 'Removing SQLite from the Dockerfile'
replace_string_in_file ' sqlite3' '' 'Dockerfile'

# Remove "#POSTGRES#" in build-log.sh
echo 'Updating build-log.sh'
replace_string_in_file '#POSTGRES#' '' 'build-log.sh'

# Remove "#POSTGRES#" in .gitignore
echo 'Updating .gitignore'
replace_string_in_file '#POSTGRES#' '' '.gitignore'

# Remove "#POSTGRES#" in docker-compose.yml
echo 'Updating docker-compose.yml'
replace_string_in_file '#POSTGRES#' '' 'docker-compose.yml'

# Remove "#POSTGRES#" in bin/dmigrate and keep it executable
echo 'Updating bin/dmigrate'
replace_string_in_file '#POSTGRES#' '' 'bin/dmigrate'
chmod +x bin/dmigrate

# Remove "#POSTGRES#" in bin/dinfo and keep it executable
echo 'Updating bin/dinfo'
replace_string_in_file '#POSTGRES#', '', 'bin/dinfo'
chmod +x bin/dinfo

# Remove the SQLite section in the Gemfile
echo 'Removing SQLite from the Gemfile'
delete_between_strings_in_file '# BEGIN: SQLite' '# END: SQLite' 'Gemfile'
replace_string_in_file '# BEGIN: SQLite', '', 'Gemfile'
replace_string_in_file '# END: SQLite', '', 'Gemfile'

# Remove the excess blank lines
# Source:
# https://stackoverflow.com/questions/922449/how-can-i-replace-multiple-empty-lines-with-a-single-empty-line-in-bash
echo 'Removing excess blank lines from the Gemfile'
cat -s Gemfile > Gemfile-new
mv Gemfile-new Gemfile

# BEGIN: Update the pg section in the Gemfile
# (pg for all environments, not just production)
echo 'Updating the pg section in the Gemfile'

# 1.  Get the line specifying the pg gem AND its pinned version
LINE_PG=`grep "gem 'pg'" Gemfile`

# 2.  Delete everything between '# BEGIN: pg section' and $LINE_PG
delete_between_strings_in_file '# BEGIN: pg section' "$LINE_PG" 'Gemfile'

# 3.  Delete everything between $LINE_PG and '# END: pg section'
delete_between_strings_in_file "$LINE_PG" '# END: pg section' 'Gemfile'

# 4.  Remove the indent in the pg line (no longer needed)
replace_string_in_file "  gem 'pg'" "gem 'pg'" Gemfile

# END: Update the pg section in the Gemfile

echo 'git rm config/database.yml'
git rm config/database.yml

echo 'Configure config/database.yml'
cp config/database-pg.yml config/database.yml

echo 'Configure .env/development/database'
cp .env/development/database-template .env/development/database
replace_string_in_file 'POSTGRES_DB_1' $DB_ROOT '.env/development/database'
replace_string_in_file 'POSTGRES_USER_1' $DB_USERNAME '.env/development/database'
replace_string_in_file 'POSTGRES_PASSWORD_1' $DB_PASSWORD '.env/development/database'

echo 'Configure init.sql'
cp init.sql.template init.sql
replace_string_in_file 'POSTGRES_USER_1' $DB_USERNAME 'init.sql'
replace_string_in_file 'POSTGRES_PASSWORD_1' $DB_PASSWORD 'init.sql'
chmod +x init.sql

echo '*****************************************************'
echo 'The transition from SQLite to PostgreSQL is complete!'
echo 'Enter the following commands:'
echo 'bash nuke.sh'
echo 'bash build.sh'
