#!/bin/bash

set -e

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

MYSQL_PASSWORD=$(cat /run/secrets/db_password)
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

if [ ! -f /var/lib/mysql/.wp_setup_complete ]; then 
    mariadb-install-db --datadir=/var/lib/mysql --user=mysql 
    mariadbd --datadir=/var/lib/mysql --user=mysql &
    until mysqladmin ping -u root --silent > /dev/null 2>&1; do :; done
    mysql -u root <<EOF
    CREATE DATABASE wordpress;
    CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOF

    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
    touch /var/lib/mysql/.wp_setup_complete
fi

exec mariadbd --datadir=/var/lib/mysql --user=mysql
