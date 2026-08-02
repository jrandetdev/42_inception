#!/bin/bash
#strict mode
set -e

DIRECTORY="/var/lib/mysql"

if ! [ -d "$DIRECTORY" ]; then
	#first terminal
    echo "Initializing database"
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	mariadbd --user=mysql --skip-networking &
	pid="$!"
	#second terminal
	while ! /usr/bin/mysqladmin ping -u root; do #here we are back in the bash and need to come  back to our process 
		sleep 1
	done
    mariadb -u root << EOF
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOF
	kill $pid
	wait $pid
fi
echo "MariaDB ready!"

exec mariadbd

