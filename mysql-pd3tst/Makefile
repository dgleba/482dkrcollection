
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl



p:  
	docker-compose run --rm dbm sh -c 'chmod 777 /in-out'
	
x:  
	chmod +x *.sh
	
imp:
	docker-compose  exec dbm /bin/bash /root/imp-pd3.sh
  
mysh:
	docker-compose  -f docker-compose.yml exec dbm /bin/bash

dump:
	docker-compose  exec dbm /bin/bash /root/all-individual-mysqldump.sh


# got error changing database user in metabase.. java.sql.SQLException: null, message from server: "Host 'pmdsdata8.stackpole.ca' is blocked because of many connection errors; unblock with 'mysqladmin flush-hosts'"
myflu:
	docker-compose  -f docker-compose.yml run --rm  dbm sh -c 'mysqladmin -u$$MYSQL_ROOT_USER -p$$MYSQL_ROOT_PASSWORD flush-hosts;'


mkd:
	 docker-compose exec db /bin/bash /root/mkdata.sh

mp:
	docker-compose  exec dbm sh -c 'mysql -uroot -p$$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON *.* TO ciuser@% IDENTIFIED BY $$mysqluserpass with Grant;"'

sh:
	docker-compose  run --rm dbm  bash

	

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
#  other and `less common` stuff...


mycrd1:
	docker-compose exec dbm /bin/bash /root/dbcr.sh

myimpa1:
	docker-compose  -f mysql/docker-compose.yml exec dbm /bin/bash /root/sh21.sh

	

mydumpb1:
	docker-compose  -f mysql/docker-compose.yml exec dbm sh -c 'exec mysqldump  --force --opt --user=root -p"$$MYSQL_ROOT_PASSWORD" --databases dkrdbm dgnote130  \
    --complete-insert --quote-names  --allow-keywords  \
    --skip-add-drop-table --add-drop-database  --skip-lock-tables  --no-tablespaces --no-create-info --routines  \
    --events  > /home/db_mysqldump.sql '




mycrd91:
	docker-compose exec dbm sh -c 'exec mysql  -uroot -p"$$MYSQL_ROOT_PASSWORD"  -e "create database \
			if not exists metabasedb"'

			
myrup1:  
# db recreate build force
	docker-compose  up --build  --force-recreate  
 
myup1:  
# db up
	docker-compose up 

phprup1:  
	# docker-compose  -f php/docker-compose.yml stop \
	docker-compose  -f ../php392/docker-compose.yml up --build  --force-recreate  
   
phpup1:  
	docker-compose  -f ../php392/docker-compose.yml up 
   
   
myl:
	docker-compose  -f mysql/docker-compose.yml logs -t -f

adup1:  
	docker-compose  -f ../adminer392/docker-compose.yml up --build  --force-recreate  

myd1:  
# dump
	docker-compose  -f mysql/docker-compose.yml run

 

# run system with umask test dockerfile
# I can't seem to get writable group permissions 2018-08-27_Mon_21.28-PM
#
umasktest:
	docker-compose  -f docker-compose.devtest.yml  run djangodev  django-admin.py startproject myproject .

  
# shell in django
#
djbash:
	docker-compose run djangodev /bin/bash

dps:   
	docker images
	docker network ls
	docker volume ls 
	docker ps -a
	docker ps 

  
# clean docker containers 
#
clean:   
	# remove this one.. 
	-docker rmi dkr382django2t_djangodev 
	-docker rmi dkr382r-django_djangodev
  # remove docker containers exited 
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited") 
	# remove tagged <none> 
	-docker rmi $$(docker images | grep "^<none>" | awk '{ print $3 }') 
  #volumes
	-docker volume rm $(docker volume ls -qf dangling=true)
	docker images
	docker network ls
	docker volume ls 
	docker ps -a
	docker ps 


#
dkv: 
	docker --version
	docker-compose -version

  
perm1:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	docker-compose run djangodev sh sc/fixpermsh

    
# having trouble setting env variable, but do I need it?  
#
perm2:  
	docker-compose run djangodev \
	bash -c "export fold=/myproject; chmod -R g+rws,o-w  $${fold}"

  
recreatep:  
# recreate for production...
	docker-compose -f docker-compose.prod.yml up --build  --force-recreate  

rup1:  
# dev recreate build force
	docker-compose  up --build  --force-recreate  
 
up1:  
# dev recreate build force
	docker-compose  up 
 

  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o
