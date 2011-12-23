#!/bin/bash

PID="/tmp/supervisord.pid"
PROJ="path/to/project"
ENV="virtualenv/path"

stop() {
    if [ -f $PID ]; then
        kill `cat -- $PID`
        rm -f -- $PID
        echo "stoped"
    fi
}

start() {
    echo "starting" 
    cd $PROJ
    source $ENV
    supervisord -c supervisord.conf
    echo "started"
}

backup() {
    # do backup
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
    backup)
        backup
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart|backup}"
esac
