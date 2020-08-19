#!/usr/bin/env bash
# https://github.com/panubo/docker-postfix

set -e
[ "${DEBUG:-false}" == 'true' ] && set -x

line=$(head -n 1 /etc/hosts)
line2=$(echo $line | awk '{print $2}')
echo " pmdsdata7-dkr-01.local $line $line2.localdomain" >> /etc/hosts

sed -i "/MAILER_DEF.*/i define(`SMART_HOST',`[MESG01.stackpole.ca]')dnl"  /etc/mail/sendmail.mc
make -C /etc/mail

/etc/init.d/sendmail reload

echo "Running command $*"
exec "$@"
