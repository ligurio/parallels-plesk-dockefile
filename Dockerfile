FROM ubuntu:14.04
MAINTAINER Sergey Bronnikov "sergeyb@parallels.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get -y update

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN echo "mysql-server-5.5 mysql-server/root_password password root123" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password root123" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password seen true" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again seen true" | debconf-set-selections

RUN apt-get install -y apache2 php5 php5-gd

RUN wget -q -O - http://download.owncloud.org/community/owncloud-6.0.3.tar.bz2 | tar jx -C /var/www/
RUN curl http://autoinstall.plesk.com/plesk-installer | bash

# http://kb.sp.parallels.com/ru/391
EXPOSE 20 
EXPOSE 21 
EXPOSE 25
EXPOSE 53
EXPOSE 80
EXPOSE 106
EXPOSE 110
EXPOSE 113
EXPOSE 143
EXPOSE 443
EXPOSE 465
EXPOSE 587
EXPOSE 990
EXPOSE 993
EXPOSE 995
EXPOSE 3306
EXPOSE 5224
EXPOSE 5432
EXPOSE 8443
EXPOSE 8447
EXPOSE 8880
EXPOSE 9080

CMD ["/start.sh"]
