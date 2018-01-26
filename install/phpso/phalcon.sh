#!/bin/bash
. ../common.sh
cd $PHPSO_DIR

tar zxf cphalcon7.tgz
cd cphalcon7/ext
phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install

rm -rf cphalcon7