#!/bin/sh
. ../common.sh
cd $CONF_DIR

rm -rf $PREFIX_DIR/mysql/etc
mkdir $PREFIX_DIR/mysql/etc

sed -e "s/USER/$USER/" mysql/my.cnf > $PREFIX_DIR/mysql/etc/my.cnf