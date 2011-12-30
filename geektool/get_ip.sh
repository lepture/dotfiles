#!/bin/bash

myen0=`ifconfig en0 | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'`
if [ "$myen0" != "" ]
then
    echo "Ethernet: $myen0"
else
    echo "Ethernet: INACTIVE"
fi
myen1=`ifconfig en1 | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'`
if [ "$myen1" != "" ]
then
    echo "Wireless: $myen1"
else
    echo "Wireless: INACTIVE"
fi
wip=`curl --silent http://checkip.dyndns.org | awk '{print $6}' | cut -f 1 -d "<"`
echo "RealAddr: $wip"
