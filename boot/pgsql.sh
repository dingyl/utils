#!/bin/bash
. ../common.sh
POSTGRES=/usr/local/pgsql/bin
source /etc/profile
RETVAL=0
start() {
    #只有第一次启动的时候初始化数据库
    #$POSTGRES/initdb
    nohup $POSTGRES/pg_ctl -D /usr/local/pgsql/db -l $LOG_DIR/pgsql.log start &> $LOG_DIR/postgres_init.log &
    RETVAL=$?
    return $RETVAL
}

stop() {
	pkill postgres
	RETVAL=$?
 	return $RETVAL
}

restart() {
	stop
	start
  	RETVAL=$?
  	return $RETVAL
}

case "$1" in
 start)
    start
    ;;
 stop)
    stop
    ;;
 restart)
    stop
    start
    ;;
  *)
    echo $"usage: $0 {start|stop|restart}"
    RETVAL=1
esac

exit $RETVAL
