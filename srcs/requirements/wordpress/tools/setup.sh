#!/bin/bash

MYSQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)

if [ ! -f /farah/shared/path/wp-load.php ]; then
    wp core download --path=/farah/shared/path --allow-root
fi

if [ ! -f /farah/shared/path/wp-config.php ]; then
    wp config create --path=/farah/shared/path --allow-root \
        --dbname=wordpress \
        --dbuser=${MYSQL_USER} \
        --dbpass=${MYSQL_PASSWORD} \
        --dbhost=mariadb
fi

if ! wp core is-installed --path=/farah/shared/path --allow-root; then
      wp core install --path=/farah/shared/path --allow-root \
        --url=fadarwis.42.fr \
        --title=WordPress \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=farah.darwish@learner.42.tech
fi


if ! wp user get ${WP_USER} --path=/farah/shared/path --allow-root; then 
      wp user create ${WP_USER} ${WP_USER_EMAIL} --path=/farah/shared/path --allow-root \
      --role=subscriber \
      --user_pass=${WP_USER_PASSWORD}
fi

exec php-fpm8.2 -F -R
