
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]22-38PM 


rsync -av -e ssh /home/albe/backup/mysql_indiv/  albe@10.4.1.227:/home/file/frompd3/mysql0518/


tmpf1='/tmp/rsyncfiles'
  find . -type f |grep regulr > $tmpf1 # files.
  rsync -av -e ssh --files-from=$tmpf1 /home/albe/backup/mysql_indiv/  albe@10.4.1.228:/srv/file/test/482dkrcollection/mysql-pd3tst/sysdata/in-out



# sftp://10.4.1.228/srv/file/test/482dkrcollection/mysql-pd3tst/sysdata/in-out


# find |grep struc -exec rm {} \;
cd sysdata/in-out
find . | grep struc | xargs rm -f



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  import
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-05-28[May-Thu]23-31PM 


FILES=/home/file/frompd3/mysql0527/*
find $FILES




patrn=''
# backup each database as follows..
dbarray=( 
/home/file/frompd3/mysql0527/pmdsdata3-hrdb-regulr-mysql.2020-05-17_14.59.37.sql
/home/file/frompd3/mysql0527/pmdsdata3-lukup-regulr-mysql.2020-05-17_14.59.54.sql

/home/file/frompd3/mysql0527/pmdsdata3-argostat-regulr-mysql.2020-05-17_14.59.28.sql
/home/file/frompd3/mysql0527/pmdsdata3-cilist-regulr-mysql.2020-05-17_14.59.28.sql
/home/file/frompd3/mysql0527/pmdsdata3-cmmdb-regulr-mysql.2020-05-17_14.59.29.sql
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.2020-05-17_14.59.35.sql
/home/file/frompd3/mysql0527/pmdsdata3-dgnote130-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-dkrdbdev-regulr-mysql.2020-05-17_14.59.36.sql
/home/file/frompd3/mysql0527/pmdsdata3-emptydb-regulr-mysql.2020-05-17_14.59.37.sql
/home/file/frompd3/mysql0527/pmdsdata3-greygold-regulr-mysql.2020-05-17_15.25.52.sql
/home/file/frompd3/mysql0527/pmdsdata3-hrdb_dev-regulr-mysql.2020-05-17_14.59.39.sql

/home/file/frompd3/mysql0527/pmdsdata3-ignition-regulr-mysql.2020-05-17_14.59.40.sql
/home/file/frompd3/mysql0527/pmdsdata3-leanmfg-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-leanmfg-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-lukup_pub-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-metabasedb-regulr-mysql.2020-05-17_14.59.54.sql
/home/file/frompd3/mysql0527/pmdsdata3-mysql-regulr-mysql.2020-05-17_14.59.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-phpmyadmin-regulr-mysql.2020-05-17_14.59.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-prod367db-regulr-mysql.2020-05-17_14.59.59.sql
/home/file/frompd3/mysql0527/pmdsdata3-prod367db-regulr-mysql.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb_archive-regulr-mysql.2020-05-17_15.25.58.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdb-regulr-mysql.2020-05-17_15.00.01.sql
/home/file/frompd3/mysql0527/pmdsdata3-prodrptdbtes2-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-qadata-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-qualitydb-regulr-mysql.2020-05-17_15.00.15.sql
/home/file/frompd3/mysql0527/pmdsdata3-rail_test-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-rptdb-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1-regulr-mysql.2020-05-17_15.00.17.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd1suprv-regulr-mysql.2020-05-17_15.00.20.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2-regulr-mysql.2020-05-17_15.00.22.sql
/home/file/frompd3/mysql0527/pmdsdata3-shiftcsd2suprv-regulr-mysql.2020-05-17_15.00.23.sql
/home/file/frompd3/mysql0527/pmdsdata3-shift_smsmeer-regulr-mysql.2020-05-17_15.00.16.sql
/home/file/frompd3/mysql0527/pmdsdata3-test2-regulr-mysql.2020-05-17_15.00.27.sql
/home/file/frompd3/mysql0527/pmdsdata3-test-regulr-mysql.2020-05-17_15.00.26.sql
/home/file/frompd3/mysql0527/pmdsdata3-webiddb-regulr-mysql.2020-05-17_15.00.27.sql
) 
 
sleep 2
 
date
for patrn in "${dbarray[@]}"
do
  echo "Processing $patrn file..."
  # take action on each file. $patrn store current file name
  echo $patrn
  mysql -uroot -p$mysqlrootpassw  < $patrn
done    
	
	
	

patrn=''
# backup each database as follows..
dbarray=( 
/in-out/pmdsdata3-hrdb-regulr-mysql.2020-05-17_14.59.37.sql
/in-out/pmdsdata3-lukup-regulr-mysql.2020-05-17_14.59.54.sql

/in-out/pmdsdata3-argostat-regulr-mysql.2020-05-17_14.59.28.sql
/in-out/pmdsdata3-cilist-regulr-mysql.2020-05-17_14.59.28.sql
/in-out/pmdsdata3-cmmdb-regulr-mysql.2020-05-17_14.59.29.sql
/in-out/pmdsdata3-dgnote130-regulr-mysql.2020-05-17_14.59.35.sql
/in-out/pmdsdata3-dgnote130-regulr-mysql.sql
/in-out/pmdsdata3-dkrdbdev-regulr-mysql.2020-05-17_14.59.36.sql
/in-out/pmdsdata3-emptydb-regulr-mysql.2020-05-17_14.59.37.sql
/in-out/pmdsdata3-greygold-regulr-mysql.2020-05-17_15.25.52.sql
/in-out/pmdsdata3-hrdb_dev-regulr-mysql.2020-05-17_14.59.39.sql

/in-out/pmdsdata3-ignition-regulr-mysql.2020-05-17_14.59.40.sql
/in-out/pmdsdata3-leanmfg-regulr-mysql.2020-05-17_14.59.54.sql
/in-out/pmdsdata3-leanmfg-regulr-mysql.sql
/in-out/pmdsdata3-lukup_pub-regulr-mysql.2020-05-17_14.59.54.sql
/in-out/pmdsdata3-metabasedb-regulr-mysql.2020-05-17_14.59.54.sql
/in-out/pmdsdata3-mysql-regulr-mysql.2020-05-17_14.59.58.sql
/in-out/pmdsdata3-phpmyadmin-regulr-mysql.2020-05-17_14.59.58.sql
/in-out/pmdsdata3-prod367db-regulr-mysql.2020-05-17_14.59.59.sql
/in-out/pmdsdata3-prod367db-regulr-mysql.sql
/in-out/pmdsdata3-prodrptdb_archive-regulr-mysql.2020-05-17_15.25.58.sql
/in-out/pmdsdata3-prodrptdb-regulr-mysql.2020-05-17_15.00.01.sql
/in-out/pmdsdata3-prodrptdbtes2-regulr-mysql.2020-05-17_15.00.15.sql
/in-out/pmdsdata3-qadata-regulr-mysql.2020-05-17_15.00.15.sql
/in-out/pmdsdata3-qualitydb-regulr-mysql.2020-05-17_15.00.15.sql
/in-out/pmdsdata3-rail_test-regulr-mysql.2020-05-17_15.00.16.sql
/in-out/pmdsdata3-rptdb-regulr-mysql.2020-05-17_15.00.16.sql
/in-out/pmdsdata3-shiftcsd1-regulr-mysql.2020-05-17_15.00.17.sql
/in-out/pmdsdata3-shiftcsd1suprv-regulr-mysql.2020-05-17_15.00.20.sql
/in-out/pmdsdata3-shiftcsd2-regulr-mysql.2020-05-17_15.00.22.sql
/in-out/pmdsdata3-shiftcsd2suprv-regulr-mysql.2020-05-17_15.00.23.sql
/in-out/pmdsdata3-shift_smsmeer-regulr-mysql.2020-05-17_15.00.16.sql
/in-out/pmdsdata3-test2-regulr-mysql.2020-05-17_15.00.27.sql
/in-out/pmdsdata3-test-regulr-mysql.2020-05-17_15.00.26.sql
/in-out/pmdsdata3-webiddb-regulr-mysql.2020-05-17_15.00.27.sql
) 



