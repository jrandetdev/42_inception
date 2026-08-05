FROM debian:bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm php-mysqli php-curl php-gd php-mbstring php-xml php-zip \
    curl ca-certificates mariadb-client \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& mkdir -p /var/www/html/myawesomewebsite.com \
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i "s|^listen = .*|listen = 9000|" /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www/html

VOLUME /var/www/html

COPY /tools/wordpress-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress-entrypoint.sh

EXPOSE ${WP_PORT}

ENTRYPOINT ["wordpress-entrypoint.sh"]

CMD ["php-fpm8.2", "-F" ]