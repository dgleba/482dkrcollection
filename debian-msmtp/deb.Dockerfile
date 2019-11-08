FROM debian:10
# noneed RUN mkdir /app

RUN apt-get update 

# RUN echo "postfix	postfix/mailname string pmdsdata7-dkr-01.local" | debconf-set-selections 

Run  apt-get -y install  msmtp  
# RUN  apt-get -y install  mc 

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

# COPY entry.sh /app 
# Run  chmod +x /app/entry.sh

ENTRYPOINT ["/app/entry.sh"]

# notes

#  && echo "postfix postfix/relayhost string MESG01.stackpole.ca" | debconf-set-selections \
# COPY requirements.txt /app/
# RUN pip install -r requirements.txt

