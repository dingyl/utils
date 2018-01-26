#!/bin/bash
. ../common.sh
cd $BIN_DIR
tar zxf postgresql-9.3.5.tar.gz
cd postgresql-9.3.5
./configure --prefix=/usr/local/pgsql
make
make install
mkdir /usr/local/pgsql/db
#初始化postgres
/usr/local/pgsql/bin/initdb --pgdata=/usr/local/pgsql/db  --username=postgres
rm -rf postgresql-9.3.5