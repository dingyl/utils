#!/bin/bash
. ../common.sh
cd $BIN_DIR
unzip elasticsearch-5.6.3.zip
mv elasticsearch-5.6.3 /usr/local/elasticsearch
mkdir /usr/local/elasticsearch/data
mkdir $LOG_DIR/elasticlog