#!/bin/bash
./nginx.sh stop
./redis.sh stop
./ssdb.sh stop
./pgsql.sh stop
./mysql.sh stop
./fpm.sh stop
./elasticsearch.sh stop