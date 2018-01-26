#!/bin/bash
./nginx.sh start
./redis.sh start
./ssdb.sh start
./pgsql.sh start
./mysql.sh start
./fpm.sh start
./elasticsearch.sh start