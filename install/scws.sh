#!/bin/bash
. ../common.sh
cd $BIN_DIR
tar jxf scws-1.2.3.tar.bz2
cd scws-1.2.3
./configure --prefix=/usr/local/scws
make && make install
rm -rf scws-1.2.3