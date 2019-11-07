# simple debian to test sendmail

# Instructions

## build

docker-compose build

## send mail.

```
echo "Subject: test 452" | /usr/sbin/sendmail dgleba@stackpole.com

or
see makefile
```


# Notes

### copy files out of container.

```

contnr=debian-smpl_deb_run_8299f6d1d712
src=$contnr:/etc/mail
out=/srv/file/test/tmp/etcmail-03
mkdir -p $out
docker cp $src $out


src=debian-smpl_deb_run_4c1313d4e230:/etc/postfix
out=/srv/file/test/tmp/etcpostfix
mkdir -p $out
docker cp $src $out

```


dkd --remove-orphans
