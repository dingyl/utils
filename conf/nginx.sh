#!/bin/sh
. ../common.sh
cd $CONF_DIR

rm -rf $PREFIX_DIR/nginx/conf/vhost
mkdir $PREFIX_DIR/nginx/conf/vhost

sed -e "s/USER/$USER/" -e "s/GROUP/$GROUP/" nginx/nginx.conf > $PREFIX_DIR/nginx/conf/nginx.conf
cp -rf nginx/enable_php.conf $PREFIX_DIR/nginx/conf/enable_php.conf
sed -e "s/USER/$USER/" nginx/vhost/tpl.conf > $PREFIX_DIR/nginx/conf/vhost/tpl.conf