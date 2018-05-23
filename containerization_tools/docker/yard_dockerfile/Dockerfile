FROM ubuntu
MAINTAINER Jaya Prakash


RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install php
RUN apt-get -y install php-fpm
RUN apt-get -y install nodejs
#RUN apt-get -y install tomcat


EXPOSE 80

ADD start.sh /root

RUN chmod 755 /root/start.sh

#ENTRYPOINT ["/root/start.sh"]
#ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]

ENTRYPOINT ["nginx", "-D", "FOREGROUND"]




