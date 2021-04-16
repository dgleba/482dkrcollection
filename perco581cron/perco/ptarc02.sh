
echo 
echo  Starting ptarc02.sh  Rev: 3 -  $(date +"%Y.%m.%d_%H.%M.%S")

# pt-archiver --help
set -x

mkdir -p /tmp/perco
# ls -la /tmp/perco

pt-archiver --source h=192.168.88.60,P=6601,D=dkrdb,u=root,p=iof,t=mydates  \
    \
    --where 'mydate  <  date_sub( now(), interval 70 minute )'  \
    \
    --dest h=192.168.88.60,P=6601,D=dkrdb,u=root,p=iof,t=mydates_archive   \
    \
    --limit=100  --why-quit  2>&1>>/code/mydates-arch.log

pwd

tail  /code/mydates-arch.log


# eg:
#
# pt-archiver --source h=192.168.88.60,P=7411, D=dkrdb, t=data1, u=root, p=iof  \
#   --where 'id < 3'  \
#   --dest h=192.168.88.60,P=7411, D=dkrdb, t=data_archive1, u=root, p=iof   \
#   --limit=1 --no-delete --why-quit 2>&1 >> archive01.log


# test:
# select date_sub( now(), interval 280 minute)


