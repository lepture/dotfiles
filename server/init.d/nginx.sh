#!/bin/sh
### BEGIN INIT INFO
# Provides:          nginx
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: nginx init.d dash script
# Description:       nginx init.d dash script
### END INIT INFO

RUNAS=root

case "$1" in
    start)
        /usr/local/sbin/nginx
        ;;
    stop)
        /usr/local/sbin/nginx -s stop
        ;;
    quit)
        /usr/local/sbin/nginx -s quit
        ;;
    restart)
        /usr/local/sbin/nginx -s reload
        ;;
    *)
        echo "Usage: nginx.sh {start|stop|quit|restart}"
        exit 1
        ;;
esac
exit 0
