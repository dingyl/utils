#!/bin/sh
. ../common.sh
cd $CONF_DIR
cp scws/* /usr/local/scws/etc/

#extension = scws.so
#scws.default.charset = utf8
#scws.default.fpath = /usr/local/scws/etc