#!/bin/sh
. ../common.sh
cd $CONF_DIR
sed -e "s/USER/$USER/" -e "s/GROUP/$GROUP/" redis/redis.conf > $PREFIX_DIR/redis/conf/redis.conf