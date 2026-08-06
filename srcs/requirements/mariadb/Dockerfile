FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends mariadb-server && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /var/lib/mysql/* && \
    mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql
    
VOLUME /var/lib/mysql

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/mariadb-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/mariadb-entrypoint.sh

USER mysql

EXPOSE ${MARIADB_PORT}

ENTRYPOINT ["mariadb-entrypoint.sh"]

CMD ["mariadbd"]
