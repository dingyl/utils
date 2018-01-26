#!/bin/bash
. ../common.sh
cd $PHPSO_DIR
tar jxf scws-1.2.3.tar.bz2
cd scws-1.2.3/phpext
phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
rm -rf scws-1.2.3