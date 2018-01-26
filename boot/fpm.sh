#!/bin/bash
. ../common.sh
PHP_INI=/usr/local/php/etc/php.ini
PHP_FPM_CONF=/usr/local/php/etc/php-fpm.conf
NAME=php-fpm
BIN=/usr/local/php/sbin/php-fpm
LOG=$LOG_DIR/fpm_init.log
RETVAL=0

start() {
      nohup $BIN -c $PHP_INI --fpm-config=$PHP_FPM_CONF &> $LOG &
      RETVAL=$?
}
stop() {
      pkill $NAME
      RETVAL=$?
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
      echo "Usage: fpm {start|stop|restart}"
      exit 1
  ;;
esac
exit $RETVA
