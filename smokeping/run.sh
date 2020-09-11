#!/bin/bash
pkill -9 fcgiwrap > /dev/null 2>&1
rm /run/fcgiwrap.socket > /dev/null 2>&1
nohup /usr/sbin/fcgiwrap -s unix:/run/fcgiwrap.sock &

pkill -9 nginx > /dev/null 2>&1
if /usr/bin/nginx -q -t; then
  chown http:root /run/fcgiwrap.sock
  /usr/bin/nginx
else
  exit 1
fi
