#!/bin/bash

### Time zone
if [ $ZONE ]; then
    rm -f /etc/localtime
    ln -s /usr/share/zoneinfo/$ZONE /etc/localtime
fi

if [ $SECRET ]; then
    echo $SECRET >/etc/smokeping/smokeping_secrets
fi

chown www-data.www-data /etc/smokeping/smokeping_secrets
chown -R www-data.www-data /var/lib/smokeping

### Start Service
exec "$@"
