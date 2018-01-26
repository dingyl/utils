#!/bin/bash
. ../common.sh
NAME=elasticsearch
BIN=/usr/local/elasticsearch/bin/elasticsearch
RETVAL=0
LOG=$LOG_DIR/elasticsearch_init.log
start(){
	nohup $BIN -d -p /tmp/pid/elasticsearch.pid &> $LOG &
	RETVAL=$?
}

stop(){
	pkill java
}

restart(){
	stop
	start
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		restart
		;;
	*)
		echo "usage:{start|stop|restart}"
		RETVAL=1
esac
exit $RETVAL
