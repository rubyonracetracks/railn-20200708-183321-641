#!/bin/bash
set -e

d_mo_1='log/diagram-models-1'
d_mo_2='log/diagram-models-2.dot'
d_co='log/diagram-controllers.dot'
d_gems='log/diagram-gems'

echo '---------------'
echo 'Using rails-erd'
bundle exec erd --attributes=foreign_keys,primary_keys,timestamps,inheritance,content \
  --filetype=dot --filename=$d_mo_1 --inheritance=true \
  --notation=bachman --orientation=vertical --polymorphism=true

echo '---------------'
echo 'Using railroady'
bundle exec railroady -i -l -v \
  -a --show-belongs_to --all-columns -m -p -z --include-concerns -t -M \
  | dot -Tdot > $d_mo_2
bundle exec railroady -i -l -v --engine-controllers -C | dot -Tdot > $d_co
echo

echo '------------------------------'
echo "Drawing gem dependency diagram"
gem install ruby-graphviz
# NOTE: Using the --version flag causes the bundle viz command to fail
bundle viz --file=$d_gems --format=dot --requirements # --version

echo '************************'
echo 'outline.sh OUTPUT FILES:'
echo "$d_mo_1.dot"
echo "$d_mo_2"
echo "$d_co"
echo "$d_gems.dot"
echo 'Directory trees are in the log directory.'
echo

