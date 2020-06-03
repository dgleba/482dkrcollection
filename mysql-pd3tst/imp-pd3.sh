#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array



function forsomefiles()  
{
  cd /
  # find  ./sysdata/in-out/* -type f  | grep -v prodrptdb_archive | grep -v cmmdb  | grep -v ignition | sort >/tmp/filelist.txt
  find   /in-out/*  -type f  | grep -v prodrptdb_archive | grep -v cmmdb  | grep -v ignition | sort >/tmp/filelist.txt
  cat /tmp/filelist.txt
  read -rsp $'Wait x Seconds or Press escape to continue...\n' -t 611 -d $'\e'

  while read F  ; do
    echo $F
      mysql --local-infile=1 -u$MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD"  < $F
      date
  done </tmp/filelist.txt
}


function forfiles()  
{
#!/bin/bash
# cd ; source shc/21env.sh
FILES=/in-out/*
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  echo $f
  mysql --local-infile=1 -u$MYSQL_USER -p"$MYSQL_PASSWORD"  < $f
  date
done
}


function forarray()  
{
patrn=''
#  each database as follows..

example_dbarray_example=( 
/in-out/mysql_mysqldump_typ1.sql
/in-out/mt.sql
) 

dbarray=( 
/in-out/mysql_mysqldump_typ1.sql
) 
 
date
for patrn in "${dbarray[@]}"
do
  echo "Processing $patrn file..."
  # take action on each file. $patrn store current file name
  echo $patrn
  mysql --local-infile=1 -uroot -p"$MYSQL_ROOT_PASSWORD"  < $patrn
  date
done 
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function notes()  
{
exit 999

# mysql -udg417 -p$pw -e "truncate table lukup.emp_enterprise"

echo 'msg-2020-05-29_Fri_19.53-PM'

# mysql --local-infile=1  -uroot -p"$MYSQL_ROOT_PASSWORD"</root/sh21.sql

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





function main1() 
{
set -vx

# usage: see makefile

echo 'msg-1020-05-29_Fri_19.53-PM'

sleep 2

forarray
#forsomefiles
#forfiles

}



main1
date


