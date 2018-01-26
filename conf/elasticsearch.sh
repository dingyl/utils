#!/bin/sh
. ../common.sh
cd $CONF_DIR
sed -e "s/USER/$USER/" elasticsearch/elasticsearch.yml > $PREFIX_DIR/elasticsearch/config/elasticsearch.yml