#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/db_password)
ADMIN_PASSWORD=$(cat /run/secrets/credentials | head -n -1)
USER_PASSWORD=$(cat /run/secrets/credentials | tail -1)

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "WordPress is already installed. Skipping installation."
else
    echo "Installing WordPress..."

    wget https://wordpress.org/latest.tar.gz
    tar -xvzf latest.tar.gz -C /var/www/html/
    rm -f latest.tar.gz

    chown -R www-data:www-data /var/www/html/wordpress
    chmod -R 755 /var/www/html/wordpress

    cd /var/www/html/wordpress
    wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}" --allow-root

    wp core install --url="localhost" --title="${TITLE}" --admin_user="${ADMIN_USER}" \
       --admin_password="${ADMIN_PASSWORD}" --admin_email="${ADMIN_EMAIL}" --allow-root

    wp user create "$EDITOR_USER" "$EDITOR_USER@1337.com" --user_pass="${USER_PASSWORD}" --role=editor --allow-root

    wp config set WP_REDIS_HOST 'redis' --allow-root
    wp config set WP_CACHE 'true' --raw --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root
fi

exec php-fpm7.4 -F
