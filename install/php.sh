#!/bin/bash
. ../common.sh
cd $BIN_DIR
tar zxf php-7.1.4.tar.gz
cd php-7.1.4
./configure --prefix=/usr/local/php --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-pgsql=/usr/local/pgsql --with-pdo-pgsql=/usr/local/pgsql --with-config-file-path=/usr/local/php/etc --with-config-file-scan-dir=/usr/local/php/conf.d --enable-fpm --with-fpm-user=ding --with-fpm-group=ding  --with-mcrypt --enable-zip --enable-mbstring --enable-fpm --enable-opcache  --with-curl --with-libedit  --enable-pcntl   --enable-sysvmsg  --with-zlib-dir   --with-gd --with-jpeg-dir  --with-png-dir --with-freetype-dir --with-iconv=/usr/local  --enable-bcmath --with-openssl

make
make install

curl -sS https://getcomposer.org/installer | /usr/local/php/bin/php
mv composer.phar /usr/local/php/bin/composer

$CONF_DIR/php.sh