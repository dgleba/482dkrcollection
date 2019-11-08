FROM debian:10

RUN apt-get update 

RUN echo "postfix	postfix/mailname string debian-smpl-dkr.local" | debconf-set-selections \
  && echo "postfix postfix/relayhost string MESG01.stackpole.ca" | debconf-set-selections \
  && echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections \
  &&  apt-get -y install  postfix    mailutils    mc

# put things that take a long time first. changing files in side with copy or workdir will invalidate cache.

RUN line=$(head -n 1 /etc/hosts) \
  && line2=$(echo $line | awk '{print $2}') \
  && echo " pmdsdata7-dkr-01.local $line $line2.localdomain" >> /etc/hosts \
  && echo "pmdsdata7-dkr-01.local" > /etc/hostname 

WORKDIR /app

COPY entry.sh /app

Run service postfix restart


# notes

# COPY requirements.txt /app/
# RUN pip install -r requirements.txt

