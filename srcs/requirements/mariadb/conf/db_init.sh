service mysql start

sleep 5

mysql -e "create database ${MARIADB_DATABASE};"
mysql -e "create user ${MARIADB_USER}@'%' identified by '${MARIADB_PASSWORD}';"
mysql -e "grant all privileges on ${MARIADB_DATABASE}.* to '${MARIADB_USER}'@'%'; flush privileges;"
mysql -e "alter user 'root'@'localhost' identified by '${MARIADB_ROOT_PASSWORD}'; flush privileges;"

service mysql restart

