# Install Parallels Plesk Panel Following the Instructions at Parallels website
# Ref: http://download1.parallels.com/Plesk/Doc/en-US/online/plesk-installation-upgrade-migration-guide/

FROM ubuntu:14.04
MAINTAINER Sergey Bronnikov "sergeyb@parallels.com"

ENV DEBIAN_FRONTEND noninteractive
ENV PLESK_DISABLE_HOSTNAME_CHECKING yes
ENV PLESK_EMAIL john@doe.com
ENV PLESK_PASSWORD WozXSDvT/9HtyAmyma6W7g=
ENV PLESK_COMPANY "John Doe company"
ENV PLESK_NAME "John Doe"
ENV PLESK_PHONE 123456789
ENV PLESK_ADDRESS Red-Square
ENV PLESK_CITY Moscow
ENV PLESK_STATE Moscow
ENV PLESK_ZIP 127081
ENV PLESK_COUNTRY RU
ENV PLESK_IPRANGE 192.168.1.1

# http://kb.sp.parallels.com/en/397
#ENTRYPOINT umount /etc/hosts && hostname plesk.ubuntu.com && bash
#ENTRYPOINT umount /etc/hosts && echo '127.0.0.1 plesk.ubuntu.com' > /etc/hosts && bash
#RUN echo "127.0.0.1	plesk.parallels.com" | sudo tee -a /etc/hosts

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install curl

RUN curl -O http://autoinstall.plesk.com/Parallels_Installer/parallels_installer_Ubuntu_14.04_x86_64
RUN chmod +x parallels_installer_Ubuntu_14.04_x86_64

RUN mkdir -p /etc/mysql/conf.d/
RUN echo "[mysqld]"                       > /etc/mysql/conf.d/docker.cnf
RUN echo "bind-address   = 0.0.0.0"      >> /etc/mysql/conf.d/docker.cnf
RUN echo "innodb_flush_method = O_DSYNC" >> /etc/mysql/conf.d/docker.cnf
RUN echo "skip-name-resolve"             >> /etc/mysql/conf.d/docker.cnf
RUN echo "init_file = /etc/mysql/init"   >> /etc/mysql/conf.d/docker.cnf
RUN echo "GRANT ALL ON *.* TO root@'%'" >   /etc/mysql/init

RUN ./parallels_installer_Ubuntu_14.04_x86_64 	\
	--select-product-id plesk 		\
	--select-release-latest 		\
	--install-component common

ADD ppp_multi_version_unix_key.xml /root/

# http://kb.sp.parallels.com/ru/391
EXPOSE 8880

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
