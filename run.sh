#!/bin/sh

if [ -z "${USERGRID_HOST}" ]; then
  # ip and port of the usergrid api
  USERGRID_HOST=192.168.1.34:8080
fi

# patch url where the portal can find the usergrid api
sed -i "s#Usergrid.overrideUrl = 'http://localhost:8080/';#Usergrid.overrideUrl = 'http://${USERGRID_HOST}/';#g" /var/www/html/config.js

service nginx start
tail -f /var/log/nginx/error.log /var/log/nginx/access.log
