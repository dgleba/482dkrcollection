# simple debian to test msmtp

# Instructions

## build

docker-compose build

## send mail.

```


see makefile


```


# Notes

### copy files out of container.

```


Copy files from container for viewing.

contnr=debian-smpl_deb_run_8299f6d1d712
src=$contnr:/etc/mail
out=/srv/file/test/tmp/etcmail-03
mkdir -p $out
docker cp $src $out


src=debian-smpl_deb_run_4c1313d4e230:/etc/postfix
out=/srv/file/test/tmp/etcpostfix
mkdir -p $out
docker cp $src $out


cd /srv/file/test/482dkrcollection ;  rsync -a debian-mail/ debian-mail-works04 ;  cd debian-mail


```


dkd --remove-orphans
