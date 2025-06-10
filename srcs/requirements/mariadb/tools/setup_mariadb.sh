#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/db_password)
DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chmod 755 /run/mysqld

touch init.sql

echo 'FLUSH PRIVILEGES;' > init.sql
echo 'USE mysql;' >> init.sql
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> init.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> init.sql
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" >> init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" >> init.sql
echo 'FLUSH PRIVILEGES;' >> init.sql

mariadbd --user=mysql --bootstrap < init.sql

exec mariadbd --user=mysql --bind-address=0.0.0.0
