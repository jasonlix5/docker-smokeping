#!/bin/bash

### Time zone
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/$ZONE /etc/localtime

### Smokeping Slaves Shared Secret
if [ $SECRET ]
then
    echo $SECRET > /secret.txt
fi

### Start Service
/etc/init.d/fcgiwrap start
/etc/init.d/smokeping start

nginx -g "daemon off;"