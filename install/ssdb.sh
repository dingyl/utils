#!/bin/bash
. ../common.sh

cd $BIN_DIR
unzip ssdbmaster.zip
cd ssdb-master
make clean
make

rm -rf /usr/local/ssdb
mkdir /usr/local/ssdb
mkdir /usr/local/ssdb/bin
mkdir /usr/local/ssdb/db
mkdir /usr/local/ssdb/conf

cp ssdb-server /usr/local/ssdb/bin/
cp ssdb.conf /usr/local/ssdb/conf/
cp -R ./api/ /usr/loca/ssdb/
cp -R ./tools/ /usr/local/ssdb/

rm -rf ssdb-master
$CONF_DIR/ssdb.sh