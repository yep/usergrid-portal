#!/bin/sh

if [ -n "${USERGRID_HOST}" ]; then
  # patch url where the portal can find the usergrid api if USERGRID_HOST is set
  sed -i "s#Usergrid.overrideUrl = 'http://localhost:8080/';#Usergrid.overrideUrl = 'http://${USERGRID_HOST}/';#g" /var/www/html/config.js
fi

service nginx start
tail -f /var/log/nginx/error.log /var/log/nginx/access.log
