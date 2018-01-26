#!/bin/bash
. ../common.sh

NAME=mysqld
BIN=/usr/local/mysql/bin/mysqld
RETVAL=0
LOG=$LOG_DIR/mysql_init.log
start(){
	nohup $BIN &> $LOG &
	RETVAL=$?
}

stop(){
	pkill $NAME
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
exit $RETVA