#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create  owncloud

 echo "GRANT ALL ON owncloud.* TO ownclouduser@localhost IDENTIFIED BY 'ownclouddbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd

 echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.10/ /' >> /etc/apt/sources.list.d/owncloud.list
 wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.10/Release.key
 DEBIAN_FRONTEND=noninteractive apt-key add - < Release.key
 DEBIAN_FRONTEND=noninteractive apt-get update -y -q
 DEBIAN_FRONTEND=noninteractive apt-get install -y -q owncloud imagemagick php5-imagick libav-tools 
 DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends libreoffice-writer
 
 #to fix error relate to ip address of container apache2
 echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
 
 #for utf-8 support for owncloud
 sed -i 's/;default_charset = "UTF-8"/default_charset = "UTF-8"/' /etc/php5/cli/php.ini
 sed -i 's/;default_charset = "UTF-8"/default_charset = "UTF-8"/' /etc/php5/apache2/php.ini
 
 #to clear some data before saving this layer ...a docker image
 apt-get clean
 rm -rf /tmp/* /var/tmp/*
 rm -rf /var/lib/apt/lists/*
 
killall mysqld
sleep 10s

