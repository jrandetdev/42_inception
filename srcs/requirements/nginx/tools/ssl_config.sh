#!/bin/bash
mkdir -p /etc/nginx/ssl




openssl req -x509  -nodes -newkey rsa:2048 -keyout \
/etc/nginx/ssl/inceptionkey.pem -sha256 \
-days 1024 -out /etc/nginx/ssl/inception.crt \
-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=vourlogin.42.fr" \