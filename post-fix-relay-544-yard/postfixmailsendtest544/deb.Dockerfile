FROM debian:10

RUN apt-get update 

RUN echo "postfix	postfix/mailname string mail544.local" | debconf-set-selections \
  && echo "postfix postfix/main_mailer_type string 'Satellite system'" | debconf-set-selections \
  &&  apt-get -y install  postfix mailutils nano


RUN sed -i '/relayhost*/c\relayhost = [192.168.88.60]:25' /etc/postfix/main.cf

RUN echo "alias ll='ls -la'" >>   ~/.bash_aliases; \
    echo "alias hi='history'" >>   ~/.bash_aliases

WORKDIR /app

COPY entry.sh /app 
Run  chmod +x /app/entry.sh

ENTRYPOINT ["/app/entry.sh"]

# notes


