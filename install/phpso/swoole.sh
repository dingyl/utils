#!/bin/bash
. ../common.sh
cd $PHPSO_DIR
unzip swoole.zip
cd swoole
phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
rm -rf swoole