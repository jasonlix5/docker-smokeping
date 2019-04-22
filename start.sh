#!/bin/bash

### Start Service
/etc/init.d/fcgiwrap start
/etc/init.d/smokeping start

nginx -g "daemon off;"
