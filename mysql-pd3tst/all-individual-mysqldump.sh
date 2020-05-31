#!/usr/bin/env bash

date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga [dirname $0 basename $0] `dirname "$0"`/`basename "$0"` 
#echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
echo bashsource@0: "${BASH_SOURCE[@]}"  # echo full bashsource array

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  backup indiv dbs except those in exclude list..

usage: 

 see makefile


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

main1()
{
  TIMESTAMP=$(date +"%F")

  BACKUP_DIR="/home"

  # get from env or..
  # MYSQL_USER="root"
  # see below..  MYSQL_PASSWORD="$mysqlrootpassw"

  MYSQL=mysql
  #MYSQLDUMP=/usr/bin/mysqldump
  MYSQLDUMP=mysqldump

  mkdir -p "$BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"/t1
  mkdir -p "$BACKUP_DIR"/t2
  mkdir -p "$BACKUP_DIR"/t3
  mkdir -p "$BACKUP_DIR"/stru
  mkdir -p "$BACKUP_DIR"/spec
   


  databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev \
   "(Database|cmmdb|greygold|prodrptdb_archive|argo|test|ignition|rail_test|mysql|information_schema|performance_schema)"`   # see exclude list to the left on this line.

  #   databases="dgnote130 dkrdb rptdb qualitydb"

  echo $databases 

  for db in $databases; do
    echo "${db}"
    
    # bad options... $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD    --databases "${db}" --complete-insert --quote-names  --allow-keywords \
     #  --skip-add-drop-table --add-drop-database  --skip-lock-tables  --no-tablespaces --no-create-info --routines \
     #  --events  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/t1/"${db}"_mysqldump_typ1.sql"
    
    $MYSQLDUMP --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases "${db}" --add-drop-database --routines --events --flush-privileges --allow-keywords  \
       | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/"${db}"_mysqldump_typ1.sql"

    #echo t2
    #  $MYSQLDUMP --user=$MYSQL_USER -p$MYSQL_PASSWORD    --databases "${db}" --add-drop-database --routines --events --flush-privileges \
    #     | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/"${db}"_mysqldump_typ2.sql"

    #echo t3
    #  $MYSQLDUMP --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases "${db}" | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/"${db}"_mysqldump_typ3.sql"
    #
    # with folder...
    #  $MYSQLDUMP --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases "${db}" | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/t3/"${db}"_mysqldump_typ3.sql"


    # -d = structure only all tables
    #
    $MYSQLDUMP --user=$MYSQL_USER -p$MYSQL_PASSWORD -d --databases "${db}"  \
        --add-drop-database  --routines --events --flush-privileges --complete-insert --allow-keywords \
        | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/stru/"${db}"_struc_mysqldump.sql"
  done


  # special db..

  databases="mysql information_schema"

  echo $databases 
  for db in $databases; do
    echo "Special db mysql infoschema.. ${db}"
    
    $MYSQLDUMP --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases "${db}" --add-drop-database --routines --events --flush-privileges --allow-keywords  \
       --single-transaction  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/spec/"${db}"_mysqldump_typ1.sql"

    # -d = structure only all tables
    #
    $MYSQLDUMP --user=$MYSQL_USER -p$MYSQL_PASSWORD -d --databases "${db}"  \
        --add-drop-database  --routines --events --flush-privileges --complete-insert --allow-keywords  \
        --single-transaction  | grep -v 'SQL SECURITY DEFINER' > "$BACKUP_DIR/stru/"${db}"_struc_mysqldump.sql"
  done

}


main1
#
date
#

