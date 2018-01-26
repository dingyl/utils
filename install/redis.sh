#!/bin/bash
. ../common.sh

cd $BIN_DIR
tar xzf redis-4.0.2.tar.gz
cd redis-4.0.2
make

rm -rf /usr/local/redis
mkdir /usr/local/redis
mkdir /usr/local/redis/bin
mkdir /usr/local/redis/db
mkdir /usr/local/redis/conf
cp -f src/redis-benchmark /usr/local/redis/bin/
cp -f src/redis-check-aof /usr/local/redis/bin/
cp -f src/redis-check-rdb /usr/local/redis/bin/
cp -f src/redis-cli /usr/local/redis/bin/
cp -f src/redis-server /usr/local/redis/bin/
cp -f redis.conf /usr/local/redis/conf/
cd $BIN_DIR
rm -rf redis-4.0.2

$CONF_DIR/redis.sh