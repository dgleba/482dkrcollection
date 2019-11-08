
----------------------------------------------------
Title:  .
-----------------------2019-11-08[Nov-Fri]15-43PM

works.


see below.. look for..     debian-msmtp works     2019-11-08[Nov-Fri]15-42PM


there are many tries here with various setups. few work.


----------------------------------------------------


cd /srv/file/test/482dkrcollection ;  rsync -a debian-smpl/ debian-smpl-works04 ;  cd debian-smpl

cd /srv/file/test/482dkrcollection ;  rsync -a debian-mail/ debian-mail-works05 ;  cd debian-mail

cd /srv/file/test/482dkrcollection ;  rsync -a debian-mail/ debian-mail-noworky06 ;  cd debian-mail


cd /srv/file/test/482dkrcollection ;  rsync -a debian-mail08/ debian-msmtp ;  cd debian-msmtp



smtp_server=MESG01.stackpole.ca 


contnr=debian-exim_deb_run_a19cbbccd164
src=$contnr:/etc/exim4
out=/srv/file/test/tmp/etcexim-05
mkdir -p $out
docker cp $src $out


works from make sh, but not make m5

 echo "Subject: test 468" | /usr/sbin/sendmail dgleba@stackpole.com 

 
---
 
	echo "Test mail debian-exim dkr" | mail  -r dgleba@stackpole.com -s "Test mail 475"  dgleba@stackpole.com 
  
-----  
  
  
  
https://www.linode.com/docs/email/exim/sendonly-mail-server-with-exim-on-debian-6-squeeze/
  
https://stackoverflow.com/questions/27054568/exim4-config-script-automated

  
debian-exim-dkr.local; debian-exim.local; localhost.localdomain; localhost


https://gist.github.com/carlessanagustin/2570c97b89c097dc12c1

Debconf: a configuration system for Debian packages

debconf-show exim4


apt-get install debconf-utils

debconf-get-selections | grep exim


root@e98ea169c9a3:/app# debconf-get-selections | grep exim
exim4-config    exim4/dc_relay_domains  string
exim4-config    exim4/dc_relay_nets     string
exim4-config    exim4/dc_other_hostnames        string  ad033d9fefeb
# Reconfigure exim4-config instead of this package
exim4-daemon-light      exim4-daemon-light/drec error
exim4-config    exim4/dc_readhost       string
exim4-config    exim4/dc_local_interfaces       string  127.0.0.1 ; ::1
exim4-config    exim4/hide_mailname     boolean
exim4-base      exim4/purge_spool       boolean false
exim4-config    exim4/dc_minimaldns     boolean false
exim4-config    exim4/dc_eximconfig_configtype  select  local delivery only; not on a network
exim4-config    exim4/dc_postmaster     string
exim4-config    exim4/dc_localdelivery  select  mbox format in /var/mail/
exim4-config    exim4/mailname  string  ad033d9fefeb
# Reconfigure exim4-config instead of this package
exim4-base      exim4-base/drec error
exim4-config    exim4/no_config boolean true
exim4-config    exim4/dc_smarthost      string
exim4-config    exim4/use_split_config  boolean false
root@e98ea169c9a3:/app#




  
  
---




root@d185323762d5:/var# dpkg-reconfigure exim4-config
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
debconf: falling back to frontend: Readline
Mail Server configuration
-------------------------

Please select the mail server configuration type that best meets your needs.

Systems with dynamic IP addresses, including dialup systems, should generally be configured to send outgoing mail to another machine, called a 'smarthost' for delivery because many receiving
systems on the Internet block incoming mail from dynamic IP addresses as spam protection.

A system with a dynamic IP address can receive its own mail, or local delivery can be disabled entirely (except mail for root and postmaster).

  1. internet site; mail is sent and received directly using SMTP  3. mail sent by smarthost; no local mail  5. no configuration at this time
  2. mail sent by smarthost; received via SMTP or fetchmail        4. local delivery only; not on a network
General type of mail configuration: 2

The 'mail name' is the domain name used to 'qualify' mail addresses without a domain name.

This name will also be used by other programs. It should be the single, fully qualified domain name (FQDN).

Thus, if a mail address on the local host is foo@example.org, the correct value for this option would be example.org.

This name won't appear on From: lines of outgoing messages if rewriting is enabled.

System mail name: p7debexim.local

Please enter a semicolon-separated list of IP addresses. The Exim SMTP listener daemon will listen on all IP addresses listed here.

An empty value will cause Exim to listen for connections on all available network interfaces.

If this system only receives mail directly from local services (and not from other hosts), it is suggested to prohibit external connections to the local Exim daemon. Such services include e-mail
programs (MUAs) which talk to localhost only as well as fetchmail. External connections are impossible when 127.0.0.1 is entered here, as this will disable listening on public network
interfaces.

IP-addresses to listen on for incoming SMTP connections:

Please enter a semicolon-separated list of recipient domains for which this machine should consider itself the final destination. These domains are commonly called 'local domains'. The local
hostname (d185323762d5) and 'localhost' are always added to the list given here.

By default all local domains will be treated identically. If both a.example and b.example are local domains, acc@a.example and acc@b.example will be delivered to the same final destination. If
different domain names should be treated differently, it is necessary to edit the config files afterwards.

Other destinations for which mail is accepted:

Please enter a semicolon-separated list of IP address ranges for which this system will unconditionally relay mail, functioning as a smarthost.

You should use the standard address/prefix format (e.g. 194.222.242.0/24 or 5f03:1200:836f::/48).

If this system should not be a smarthost for any other host, leave this list blank.

Machines to relay mail for:

Please enter the IP address or the host name of a mail server that this system should use as outgoing smarthost. If the smarthost only accepts your mail on a port different from TCP/25, append
two colons and the port number (for example smarthost.example::587 or 192.168.254.254::2525). Colons in IPv6 addresses need to be doubled.

If the smarthost requires authentication, please refer to the Debian-specific README files in /usr/share/doc/exim4-base for notes about setting up SMTP authentication.

IP address or host name of the outgoing smarthost: MESG01

The headers of outgoing mail can be rewritten to make it appear to have been generated on a different system. If this option is chosen, 'p7debexim.local', 'localhost' and '' in From, Reply-To,
Sender and Return-Path are rewritten.


Hide local mail name in outgoing mail? [yes/no] no

In normal mode of operation Exim does DNS lookups at startup, and when receiving or delivering messages. This is for logging purposes and allows keeping down the number of hard-coded values in
the configuration.

If this system does not have a DNS full service resolver available at all times (for example if its Internet access is a dial-up line using dial-on-demand), this might have unwanted
consequences. For example, starting up Exim or running the queue (even with no messages waiting) might trigger a costly dial-up-event.

This option should be selected if this system is using Dial-on-Demand. If it has always-on Internet access, this option should be disabled.

Keep number of DNS-queries minimal (Dial-on-Demand)? [yes/no] no

Exim is able to store locally delivered email in different formats. The most commonly used ones are mbox and Maildir. mbox uses a single file for the complete mail folder stored in /var/mail/.
With Maildir format every single message is stored in a separate file in ~/Maildir/.

Please note that most mail tools in Debian expect the local delivery method to be mbox in their default.

  1. mbox format in /var/mail/  2. Maildir format in home directory
Delivery method for local mail:

Delivery method for local mail: 1

The Debian exim4 packages can either use 'unsplit configuration', a single monolithic file (/etc/exim4/exim4.conf.template) or 'split configuration', where the actual Exim configuration files
are built from about 50 smaller files in /etc/exim4/conf.d/.

Unsplit configuration is better suited for large modifications and is generally more stable, whereas split configuration offers a comfortable way to make smaller modifications but is more
fragile and might break if modified carelessly.

A more detailed discussion of split and unsplit configuration can be found in the Debian-specific README files in /usr/share/doc/exim4-base.

Split configuration into small files? [yes/no] n

Mail for the 'postmaster', 'root', and other system accounts needs to be redirected to the user account of the actual system administrator.

If this value is left empty, such mail will be saved in /var/mail/mail, which is not recommended.

Note that postmaster's mail should be read on the system to which it is directed, rather than being forwarded elsewhere, so (at least one of) the users listed here should not redirect their mail
off this machine. A 'real-' prefix can be used to force local delivery.

Multiple user names need to be separated by spaces.

Root and postmaster mail recipient: root p7debexim.local

invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of restart.
root@d185323762d5:/var#






root@d185323762d5:/etc# debconf-show exim4-config
* exim4/dc_postmaster: root p7debexim.local
* exim4/hide_mailname: false
  exim4/exim4-config-title:
* exim4/dc_local_interfaces:
* exim4/mailname: p7debexim.local
  exim4/dc_relay_domains:
* exim4/dc_minimaldns: false
* exim4/use_split_config: false
  exim4/no_config: true
* exim4/dc_smarthost: MESG01
* exim4/dc_relay_nets:
* exim4/dc_eximconfig_configtype: mail sent by smarthost; received via SMTP or fetchmail
* exim4/dc_localdelivery: mbox format in /var/mail/
  exim4/dc_readhost:
* exim4/dc_other_hostnames:
root@d185323762d5:/etc#


service exim4 restart




  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

msmtp --version


root@258ed10ed709:/app# msmtp --version
msmtp version 1.8.3
Platform: x86_64-pc-linux-gnu
TLS/SSL library: GnuTLS
Authentication library: GNU SASL
Supported authentication methods:
plain scram-sha-1 external gssapi cram-md5 digest-md5 login ntlm
IDN support: enabled
NLS: enabled, LOCALEDIR is /usr/share/locale
Keyring support: none
System configuration file name: /etc/msmtprc
User configuration file name: /root/.msmtprc

Copyright (C) 2019 Martin Lambers and others.


_____________


tee heredoc Doesn't work in dockerfile..


tee -a /etc/msmtprc <<- 'HEREDOC'
# A system wide configuration file is optional.
# If it exists, it usually defines a default account.
# This allows msmtp to be used like /usr/sbin/sendmail.
account default

# The SMTP smarthost
host MESG01.stackpole.ca

# Use TLS on port 465
#port 465
#tls on
#tls_starttls off

# Construct envelope-from addresses of the form "user@oursite.example"
#auto_from on
#maildomain oursite.example

# Syslog logging with facility LOG_MAIL instead of the default LOG_USER
syslog LOG_MAIL
HEREDOC
sleep 3
cat /etc/msmtprc

--


Doesn't work in dockerfile..
eg...  
tee -a ~/.bash_aliases <<- 'HEREDOC'
alias sp='dts=$(date +"%Y-%m-%d_%H.%M.%S"); seq 1 49 | xargs -I{} date ; echo  Just the spacer only __  $dts -=-=-=-=-=-=-=-=-=-=-=-'
HEREDOC  
 
https://wiki.debian.org/msmtp
https://wiki.archlinux.org/index.php/Msmtp

root@b7e9919ccb77:/app# which msmtp
/usr/bin/msmtp
root@b7e9919ccb77:/app#


Define a default account, and put the following into ~/.mailrc:
set sendmail="/path/to/msmtp"

tee -a ~/.mailrc <<- 'HEREDOC'
set sendmail="/usr/bin/msmtp"
HEREDOC


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


https://www.virtuallyghetto.com/2017/04/quick-tip-creating-a-multiline-dockerfile-using-heredoc-wvariable-substitution.html
dockerfile multiline...

RUN echo 'set mta=/usr/bin/msmtp\n\'\
>/etc/mail.rc

cat /etc/mail.rc
 
# I didn't need the first $
RUN echo $'[powershell]\n\
baseurl='$BASEURL$'\n\
skip_if_unavailable=True\n '\
>> /etc/yum.repos.d/powershell.repo

_____________


RUN echo '\n\
# A system wide configuration file is optional.\n\
# If it exists, it usually defines a default account.\n\
# This allows msmtp to be used like /usr/sbin/sendmail.\n\
account default\n\
# The SMTP smarthost\n\
host MESG01.stackpole.ca\n\
from dgleba@stackpole.com\n\
\n\
# Syslog logging with facility LOG_MAIL instead of the default LOG_USER\n\
syslog LOG_MAIL\n\
'>/etc/msmtprc

sleep 3
cat /etc/msmtprc


	echo "Test mail debian-exim dkr" | /usr/bin/bsd-mailx  -r dgleba@stackpole.com -s "Test mail 481"  dgleba@stackpole.com 

https://wiki.archlinux.org/index.php/Msmtp
  
echo "hello there username." | msmtp -a default dgleba@stackpole.com
  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#delete image...
  docker images | grep "debian-mail" | awk '{print $1 ":" $2}' | xargs docker rmi
  docker images | grep "debian-smpl_deb" | awk '{print $1 ":" $2}' | xargs docker rmi
  docker images | grep "debian-smpl_ubu" | awk '{print $1 ":" $2}' | xargs docker rmi
  docker images | grep "ubu-smpl_ubu" | awk '{print $1 ":" $2}' | xargs docker rmi

  dkd --remove-orphans --rmi all
 
 
===================================================

printf "To: dgleba@stackpole.com From:dgleba@stackpole.com Subject: Email Test Using MSMTPnnHello there. This is email test from MSMTP." | msmtp dgleba@stackpole.com

 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2019-11-08_Fri_13.54-PM

echo "Test mail debian-exim dkr" | /usr/bin/bsd-mailx  -r dgleba@stackpole.com -s "Test mail 481"  dgleba@stackpole.com 

2019-11-08 18:48:23 1iT9J1-00001V-Cj ** dgleba@stackpole.com R=nonlocal: Mailing to remote domains not supported
2019-11-08 18:48:23 1iT9J1-00001V-Cj Frozen (delivery error message)
root@dd935ce34124:/var/log/exim4#

cat /var/log/exim4/mainlog


2019-11-08 19:03:08 1iT9XI-00002G-Gm <= dgleba@stackpole.com U=root P=local S=465
2019-11-08 19:03:08 1iT9XI-00002G-Gm ** dgleba@stackpole.com R=nonlocal: Mailing to remote domains not supported
2019-11-08 19:03:08 1iT9XI-00002I-IZ <= <> R=1iT9XI-00002G-Gm U=Debian-exim P=local S=1686
2019-11-08 19:03:08 1iT9XI-00002G-Gm Completed
2019-11-08 19:03:08 1iT9XI-00002I-IZ ** dgleba@stackpole.com R=nonlocal: Mailing to remote domains not supported
2019-11-08 19:03:08 1iT9XI-00002I-IZ Frozen (delivery error message)
root@dd935ce34124:/#


_____________





----------------------------------------------------
Title:  .
-----------------------2019-11-08[Nov-Fri]15-42PM

debian-msmtp works

albe@pmdsdata7:/srv/file/test/482dkrcollection/debian-msmtp$


https://laurentbois.wordpress.com/2007/10/20/activemailer-using-msmtp-and-gmail/


----------------------------------------------------

https://wiki.archlinux.org/index.php/Msmtp


works.

fil=/tmp/mail21.txt
tee -a $fil <<- 'HEREDOC'
To: dgleba@stackpole.com
From: dgleba@stackpole.com
Subject:  test-491
Hello there.
HEREDOC
# cat /tmp/mail21 | msmtp -a default <username>@domain.com
cat $fil | msmtp dgleba@stackpole.com dgleba@stackpole.ca


https://laurentbois.wordpress.com/2007/10/20/activemailer-using-msmtp-and-gmail/


 
 