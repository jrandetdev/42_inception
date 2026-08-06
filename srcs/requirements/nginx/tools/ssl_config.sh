#!/bin/bash
mkdir -p /etc/nginx/ssl

openssl req -x509  -nodes -newkey rsa:2048 -keyout \
/etc/nginx/ssl/inceptionkey.key -sha256 \
-days 1024 -out /etc/nginx/ssl/inception.crt \
-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=${DOMAIN_NAME}" \

envsubst '${NGINX_PORT} ${DOMAIN_NAME} ${WP_PORT}' \
	< /etc/nginx/conf.d/default.conf.template \
	> /etc/nginx/conf.d/default.conf

exec "$@"