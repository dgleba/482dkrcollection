#!/bin/bash

#
# David Gleba   2019-10-29_Tue_10.55-AM
# This works..
# https://github.com/coleifer/sqlite-web
# https://hub.docker.com/r/coleifer/sqlite-web/
#
# Example Usage:  /srv/file/test/482dkrcollection/coleifer-sqlite-web/cole.sh  /srv/file/test/vueauth/w465-invoicing-app/database/InvoicingApp.db
#


if [ $# -eq 0 ]; then
  echo "Missing required parameter: database name."
  exit 1
fi

default_port="8012"
port=${2:-$default_port}

db=$(realpath $1)
db_dir=$(dirname $db)
db_file=$(basename $db)

echo .
echo Startup Info ...
echo .
echo $default_port, $1, $db_dir, $db_file
echo .
echo .

echo "Starting on: http://127.0.0.1:$port"
docker run -it --rm -p "$port:8080" -v $db_dir:/data -e SQLITE_DATABASE="$db_file" coleifer/sqlite-web

