#!/bin/bash
. ../common.sh
NAME=/usr/local/nginx/sbin/nginx
RETVAL=0
start() {
    echo $PASSWORD |sudo -S nohup $NAME &> $LOG_DIR/nginx_init.log  &
    RETVAL=$?
    return $RETVAL
}

stop() {
    echo $PASSWORD |sudo -S nohup $NAME -s stop &> $LOG_DIR/nginx_init.log  &
}

restart() {
    echo $PASSWORD |sudo -S nohup $NAME -s reload &> $LOG_DIR/nginx_init.log  &
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
