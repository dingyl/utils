#!/bin/sh
. ../common.sh
cd $CONF_DIR

sed -e "s/USER/$USER/" -e "s/GROUP/$GROUP/" php/php.ini > $PREFIX_DIR/php/etc/php.ini
sed -e "s/USER/$USER/" -e "s/GROUP/$GROUP/" php/php-fpm.conf > $PREFIX_DIR/php/etc/php-fpm.conf
sed -e "s/USER/$USER/" -e "s/GROUP/$GROUP/" php/php-fpm.d/default.conf > $PREFIX_DIR/php/etc/php-fpm.d/default.conf