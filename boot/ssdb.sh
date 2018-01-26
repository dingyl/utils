#!/bin/bash

. ../common.sh
SSDB=/usr/local/ssdb
RETVAL=0
start() {
    nohup $SSDB/bin/ssdb-server -d $SSDB/conf/ssdb.conf &> $LOG_DIR/ssdb_init.log &
    RETVAL=$?
    return $RETVAL
}

stop() {
  $SSDB/bin/ssdb-server $SSDB/conf/ssdb.conf -s stop
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
