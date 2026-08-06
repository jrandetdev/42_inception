#!/bin/bash
#strict mode
#mariadb user is the one that does the mysql commands
set -e

DIRECTORY="/var/lib/mysql/mysql"

MARIADB_ROOT_PASSWORD="$(cat "$MARIADB_ROOT_PASSWORD_FILE")"
MARIADB_PASSWORD="$(cat "$MARIADB_PASSWORD_FILE")"

if ! [ -d "$DIRECTORY" ]; then
	#first terminal
    echo "Initializing database"
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	mariadbd --user=mysql --skip-networking &
	pid="$!"
	#second terminal
	while ! /usr/bin/mysqladmin ping -u mysql; do #here we are back in the bash and need to come  back to our process
		sleep 1
	done
    mariadb -u mysql << EOF
    CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
    CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOF
	kill $pid
	wait $pid
fi
echo "MariaDB ready!"

exec mariadbd --port="${MARIADB_PORT}"
