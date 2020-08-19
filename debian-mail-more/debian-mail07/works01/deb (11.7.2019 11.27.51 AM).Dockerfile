FROM debian:10
# noneed RUN mkdir /app

RUN apt-get update 

RUN echo "postfix	postfix/mailname string debian-smpl-dkr.local" | debconf-set-selections \
  && echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections \
  &&  apt-get -y install  mailutils   sendmail-bin sendmail sendmail-cf m4     mc 

# no luck with.. postfix

# put things that take a long time first. changing files in side with copy or workdir will invalidate cache.

# RUN sed -i '/relayhost*/c\relayhost = MESG01.stackpole.ca' /etc/postfix/main.cf

WORKDIR /app

COPY entry.sh /app

ENTRYPOINT ["/app/entry.sh"]

# notes

#  && echo "postfix postfix/relayhost string MESG01.stackpole.ca" | debconf-set-selections \

# COPY requirements.txt /app/
# RUN pip install -r requirements.txt

