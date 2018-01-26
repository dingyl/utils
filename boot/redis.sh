#!/bin/bash
. ../common.sh

RETVAL=0
BIN=/usr/local/redis/bin/redis-server
NAME=redis-server
LOG=$LOG_DIR/redis_init.log
CONF=/usr/local/redis/conf/redis.conf
start() {
  nohup $BIN $CONF &>$LOG &
  RETVAL=$?
  return $RETVAL
}

stop() {
  pkill redis
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
    echo $"Usage: $0 {start|stop|restart}"
    RETVAL=1
esac

exit $RETVAL
