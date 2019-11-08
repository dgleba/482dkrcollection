FROM debian:10
# noneed RUN mkdir /app

RUN apt-get update 

RUN echo "postfix	postfix/mailname string debian-smpl-dkr.local" | debconf-set-selections \
 && echo "postfix postfix/relayhost string MESG01.stackpole.ca" | debconf-set-selections \
  && echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections \
  &&  apt-get -y install  postfix    mailutils    mc
# RUN   apt-get -y install sendmail-bin sendmail sendmail-cf m4     

# no luck with.. postfix

# put things that take a long time first. changing files in side with copy or workdir will invalidate cache.

# RUN sed -i '/relayhost*/c\relayhost = MESG01.stackpole.ca' /etc/postfix/main.cf


RUN line=$(head -n 1 /etc/hosts) \
  && line2=$(echo $line | awk '{print $2}') \
  && echo " pmdsdata7-dkr-01.local $line $line2.localdomain" >> /etc/hosts \
  && echo "pmdsdata7-dkr-01.local" > /etc/hostname 

  # && make -C /etc/mail 

# sed -i "/MAILER_DEF.*/i define(`SMART_HOST',`[MESG01.stackpole.ca]')dnl"  /etc/mail/sendmail.mc \
#   && make -C /etc/mail \
#   && /etc/init.d/sendmail reload


WORKDIR /app

COPY entry.sh /app

ENTRYPOINT ["/app/entry.sh"]

# notes


# COPY requirements.txt /app/
# RUN pip install -r requirements.txt

