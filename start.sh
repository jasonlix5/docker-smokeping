#!/bin/bash

### Time zone
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

/etc/init.d/fcgiwrap start

if [ ! -e /var/run/smokeping ]
then
	mkdir /var/run/smokeping
fi
if [ -e /var/run/smokeping/smokeping.pid ]
then
	rm -f /var/run/smokeping/smokeping.pid
fi
smokeping --config=/etc/smokeping/config

if [ ! -e /etc/nginx/fcgiwrap.conf ]
then
	ln -s /usr/share/doc/fcgiwrap/examples/nginx.conf /etc/nginx/fcgiwrap.conf
fi

if [ ! -e /usr/share/smokeping/www/smokeping.cgi ]
then
	ln -s /usr/lib/cgi-bin/smokeping.cgi /usr/share/smokeping/www/smokeping.cgi
fi

if [ ! -e /usr/share/smokeping/www/smokeping ]
then
	ln -s /usr/share/smokeping/www /usr/share/smokeping/www/smokeping
fi

rm -f /etc/nginx/sites-enabled/default

if [ ! -e /etc/nginx/sites-enabled/smokeping ]
then
	ln -s /etc/nginx/sites-available/smokeping /etc/nginx/sites-enabled/smokeping
fi

nginx -g "daemon off;"
