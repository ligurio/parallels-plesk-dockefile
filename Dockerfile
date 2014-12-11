# Install Parallels Plesk Panel Following the Instructions at Parallels website
# Ref: http://download1.parallels.com/Plesk/Doc/en-US/online/plesk-installation-upgrade-migration-guide/

FROM ubuntu:14.04
MAINTAINER Sergey Bronnikov "sergeyb@parallels.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install curl

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN echo "127.0.0.1	plesk.parallels.com" | sudo tee -a /etc/hosts

RUN curl -O http://autoinstall.plesk.com/Parallels_Installer/parallels_installer_Ubuntu_14.04_x86_64
RUN chmod +x parallels_installer_Ubuntu_14.04_x86_64

# ./parallels_installer_Ubuntu_14.04_x86_64 --show-all-releases
# ./parallels_installer_Ubuntu_14.04_x86_64 --select-product-id plesk --select-release-latest --show-components
# Full, Typical, Custom

RUN ./parallels_installer_Ubuntu_14.04_x86_64 	\
	--select-product-id plesk 		\
	--select-release-latest 		\
	--installation-type Full

RUN /usr/local/psa/bin/init_conf --init \
	-email john@doe.com 		\
	-passwd WozXSDvT/9HtyAmyma6W7g= \
	-company "Parallels Inc."	\
	-name Administrator		\
	-phone 123456789 -address Red-Square/4 \
	-city Moscow -state Moscow -zip 630000 \
	-country RU -license_agreed true

#RUN /usr/local/psa/bin/ipmanage --update %s -type shared

ADD ppp_multi_version_unix_key.xml /root/
RUN /usr/local/psa/admin/sbin/keymng --install --source-file /root/ppp_multi_version_unix_key.xml

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

# Plesk components:
#  common            [install] - Base packages of Parallels Plesk Panel
#  panel             [install] - Parallels Plesk Panel
#  bind              [install] - BIND DNS server support
#  psa-autoinstaller [install] - Plesk Updater
#  postgresql        [install] - PostgreSQL server support
#  pmm               [install] - Plesk migration manager
#  health-monitor    [install] - Health monitor
#  fail2ban          [install] - Fail2Ban authentication failure monitor
#  sitebuilder       [install] - Parallels Presence Builder
#  mysqlgroup        [install] - MySQL server support
#  horde             [install] - Horde webmail support
#  roundcube         [install] - Roundcube webmail support
#  kav               [install] - Kaspersky antivirus
#  drweb             [install] - Parallels Premium antivirus
#  spamassassin      [install] - SpamAssassin support
#  mailman           [install] - Mailman mailing list manager support
#  postfix           [install] - Postfix mailserver
#  qmail             [install] - Qmail mailserver
#  msmtp             [install] - MSMTP relay only mailserver (SMTP client)
#  courier           [install] - Courier IMAP server
#  dovecot           [install] - Dovecot secure IMAP server with Sieve support
#  web-hosting       [install] - Plesk Web hosting
#  mod_fcgid         [install] - Apache mod_fcgid module
#  mod_perl          [install] - Apache mod_perl module
#  proftpd           [install] - ProFTPD ftpserver
#  mod-bw            [install] - Bandwidth Limiter For Apache support (mod_bw)
#  java              [install] - Tomcat Java Servlets support
#  mod_python        [install] - Apache mod_python module
#  cf-support        [install] - ColdFusion support for Plesk
#  webalizer         [install] - Webalizer webstat
#  awstats           [install] - AWStats webstat
#  modsecurity       [install] - ModSecurity Web Application Firewall for Apache
#  nginx             [install] - Nginx reverse proxy support
#  phpfpm            [install] - php-fpm support for nginx
#  phpgroup          [install] - PHP5 support
#  webservers        [install] - Apache web server support
#  config-troubleshooter[install] - Plesk Webserver Configurations Troubleshooter extension
#  psa-firewall      [install] - Plesk Firewall extension
#  psa-vpn           [install] - Plesk VPN extension
#  psa-fileserver    [install] - Plesk Fileserver extension and SMB file server package
#  sshterm           [install] - SSHTerm - SSH Terminal java applet
#  watchdog          [install] - Watchdog (System monitoring extension)
#  cloudflare        [install] - Cloudflare ServerShield extension
