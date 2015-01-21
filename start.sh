#!/bin/bash

/usr/local/psa/bin/init_conf --init		\
	-email PLESK_EMAIL			\
	-passwd PLESK_PASSWORD			\
	-company PLESK_COMPANY			\
	-name PLESK_NAME 			\
	-phone PLESK_PHONE			\
	-address PLESK_ADDRESS			\
	-city PLESK_CITY			\
	-state PLESK_STATE			\
	-zip PLESK_ZIP				\
	-country PLESK_COUNTRY			\
	-license_agreed true

# http://download1.parallels.com/Plesk/PP11/11.1/Doc/en-US/online/plesk-unix-cli/index.htm?fileName=39008.htm
/usr/local/psa/bin/ipmanage --update PLESK_IPRANGE -type shared

#ADD ppp_multi_version_unix_key.xml /root/
#RUN /usr/local/psa/admin/sbin/keymng --install --source-file /root/ppp_multi_version_unix_key.xml
#CMD [ "/usr/local/psa/admin/sbin/keymng", "--install", "--source-file /root/ppp_multi_version_unix_key.xml" ]

/etc/init.d/psa start
