#!/bin/bash
. ../common.sh
cd $PHPSO_DIR
unzip phpssdb.zip
#git clone https://github.com/jonnywang/phpssdb.git
cd phpssdb
git checkout php7
phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
rm -rf phpssdb