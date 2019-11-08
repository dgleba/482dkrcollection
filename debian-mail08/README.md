# simple debian to test sendmail

# Instructions

## build

docker-compose build

## send mail.

```

works from `make sh`, but not `make m5`

echo "Subject: test 452" | /usr/sbin/sendmail dgleba@stackpole.com

or see makefile, but I can't get those to work.


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
