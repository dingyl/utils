#!/bin/sh
. ../common.sh

cd $BIN_DIR
rm -rf /usr/local/nginx
tar -zxf nginx-1.12.1.tar.gz
cd nginx-1.12.1
./configure --prefix=/usr/local/nginx
make && make install
cd $BIN_DIR
rm -rf nginx-1.12.1

$CONF_DIR/nginx.sh
