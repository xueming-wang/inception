#!/bin/bash

service mysql start


echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" | mysql -u root 
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PWD}';"  | mysql -u root
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql -u root "wordpress" < /APP/wp.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_HOST_PSW}';"| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root



sleep infinity