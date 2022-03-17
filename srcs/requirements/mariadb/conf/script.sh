#!/bin/bash

service mysql restart

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" | mysql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PWD}';"  | mysql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PWD}';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

mysql -u root "wordpress" < /APP/wp.sql

sleep infinity