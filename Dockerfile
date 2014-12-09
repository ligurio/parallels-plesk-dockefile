FROM ubuntu:14.04
MAINTAINER Sergey Bronnikov "sergeyb@parallels.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install curl

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN curl -O http://autoinstall.plesk.com/plesk-installer
RUN chmod +x plesk-installer
CMD ["/plesk-installer"]

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

