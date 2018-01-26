#!/bin/bash
. ../common.sh
cd $PHPSO_DIR
tar zxf redis-3.1.4.tgz
cd redis-3.1.4
phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
rm -rf redis-3.1.4