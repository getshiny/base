#!/bin/sh
# echo 'hello world'


rm -f /app/tmp/pids/$1
# echo $(ls /app/tmp/pids/)

# bundle check || bundle install

bundle exec rails s -p 3000 -b 0.0.0.0 --pid /app/tmp/pids/$1
