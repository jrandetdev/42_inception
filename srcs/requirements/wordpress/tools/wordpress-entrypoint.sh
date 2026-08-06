#!/bin/bash

set -e

sed -i "s|^listen = .*|listen = ${WP_PORT}|" /etc/php/8.2/fpm/pool.d/www.conf

WP_DB_PASSWORD="$(cat "$WP_DB_PASSWORD_FILE")"
WP_ADMIN_PASSWORD="$(cat "$WP_ADMIN_PASSWORD_FILE")"
WP_USER_PASSWORD="$(cat "$WP_USER_PASSWORD_FILE")"

if ! [ -f "$CONFIG_FILE_PHP" ]; then
    wp core download --allow-root

    wp config create \
        --dbname="$WP_DB_NAME" \
        --dbuser="$WP_DB_USER" \
        --dbpass="$WP_DB_PASSWORD" \
		--dbhost="mariadb:${MARIADB_PORT}" \
		--path="/var/www/html" \
        --allow-root

    wp core install \
        --url="$WP_URL" \
        --title="My awesome Website for not so awesome inception" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
		--path="/var/www/html" \
        --allow-root

	wp user create \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
		--role=author \
        --user_pass="$WP_USER_PASSWORD" \
		--path="/var/www/html" \
        --allow-root
fi

exec "$@"