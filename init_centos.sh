#!/bin/bash
. ./common.sh

echo $PASSWORD | sudo -S setfacl -Rm u:$USER:rwx $PREFIX_DIR
echo $PASSWORD | sudo -S setfacl -Rm u:$USER:rwx $HOSTS_FILE

rm -rf $PACKAGE_DIR
mkdir $PACKAGE_DIR
rm -rf $PROJECT_DIR
mkdir $PROJECT_DIR
rm -rf $PID_DIR
mkdir $PID_DIR
rm -rf $SOCKET_DIR
mkdir $SOCKET_DIR
rm -rf $LOG_DIR
mkdir $LOG_DIR

#安装基本依赖
echo $PASSWORD | sudo yum -y install perl readline-devel pcre-devel gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libmcrypt libmcrypt-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel zlib-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers libedit libedit-devel


echo $PASSWORD | sudo yum -y install cmake

echo $PASSWORD | groupadd mysql
useradd -r -g mysql mysql -s /sbin/nologin

