#!/usr/bin/env bash
# https://github.com/panubo/docker-postfix

set -e
[ "${DEBUG:-false}" == 'true' ] && set -x

export MAILNAME='debiansmpl-dkr-pdata7.local'

# Defaults
if [ -z "$MAILNAME" ]; then
    echo "smtp >> Error: MAILNAME not specified"
    exit 128
fi

export MYNETWORKS='127.0.0.0/8, 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16'

if [ -z "$MYNETWORKS" ]; then
    echo "smtp >> Warning: MYNETWORKS not specified, allowing all private IPs"
fi

# Set timezone if set
if [ ! -z "${TZ}" ]; then
    echo "smtp >> Info: setting timezone to ${TZ}"
    ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime
    echo "${TZ}" > /etc/timezone
fi

service postfix restart


# https://stackoverflow.com/questions/26215021/configure-sendmail-inside-a-docker-container
# set host in hosts
line=$(head -n 1 /etc/hosts)
line2=$(echo $line | awk '{print $2}')
echo "$line $line2.localdomain" >> /etc/hosts

# apt-get install -y sendmail sendmail-cf m4 \
    hostname >> /etc/mail/relay-domains \
    && m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf

#remove localhost limit
sed -i -e "s/Port=smtp,Addr=127.0.0.1, Name=MTA/Port=smtp, Name=MTA/g" \
    /etc/mail/sendmail.mc
sendmail -bd


echo "Running command $*"
exec "$@"


RUN apt-get update && apt-get upgrade -y sendmail && rm -rf /var/lib/apt/lists/*
COPY ./app/ /var/www/html/
'#' to be ran with docker exec later
COPY ./config_files/mail_config.sh /var/www'
'#' php:apache recommends using your own php.ini
COPY ./config_files/php.ini /usr/local/etc/php/php.ini

.config_files/mail_config.sh example:
line=$(head -n 1 /etc/hosts)
line2=$(echo $line | awk '{print $2}')
echo "$line $line2.localdomain" >> /etc/hosts
/etc/init.d/sendmail start
sleep 1
service apache2 graceful

add to your ./config_files/php.ini:
sendmail_path = /usr/sbin/sendmail -t -i
