FROM debian:10
# noneed RUN mkdir /app

RUN apt-get update 

# RUN echo "postfix	postfix/mailname string pmdsdata7-dkr-01.local" | debconf-set-selections 

Run  apt-get -y install  msmtp  
# RUN  apt-get -y install  mc 

# with msmtp, i have not had good luck with mailutils.

# put things that take a long time first. changing files with copy or workdir will invalidate cache. put stuff that changes at the end.

# RUN sed -i '/relayhost*/c\relayhost = MESG01.stackpole.ca' /etc/postfix/main.cf


# RUN line=$(head -n 1 /etc/hosts) \
#   && line2=$(echo $line | awk '{print $2}') 

# Step 6/12 : Run sed -i '/nameserver.*/i nameserver 8.8.8.8'  /etc/resolv.conf
# sed: cannot rename /etc/sedNSM88D: Device or resource busy
# ERROR: Service 'deb' failed to build: The command '/bin/sh -c sed -i '/nameserver.*/i nameserver 8.8.8.8'  /etc/resolv.conf' returned a non-zero code: 4
# albe@pmdsdata7:/srv/file/test/482dkrcollection/debian-mail08$
# Run sed -i '/nameserver.*/i nameserver 8.8.8.8'  /etc/resolv.conf 

# RUN echo " pmdsdata7-dkr-01.local $line $line2.localdomain" >> /etc/hosts \
#   && echo "pmdsdata7-dkr-01.local" > /etc/hostname \
#   && make -C /etc/mail 

# Run service postfix restart

RUN echo 'set mta=/usr/bin/msmtp\n\
  \n'\
  >/etc/mail.rc
RUN cat /etc/mail.rc

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


WORKDIR /app

COPY entry.sh /app 
Run  chmod +x /app/entry.sh

ENTRYPOINT ["/app/entry.sh"]

# notes

#  && echo "postfix postfix/relayhost string MESG01.stackpole.ca" | debconf-set-selections \

# COPY requirements.txt /app/
# RUN pip install -r requirements.txt

