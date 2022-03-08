service mysql start

sleep 5

mysql -u root -e "create database ${MARIADB_DATABASE};"
mysql -u root -e "create user ${MARIADB_USER}@'%' identified by '${MARIADB_PASSWORD}';"
mysql -u root -e "grant all privileges on ${MARIADB_DATABASE}.* to '${MARIADB_USER}'@'%'; flush privileges;"
mysql -u root -e "alter user ${MARIADB_USER}@'%' identified by '${MARIADB_PASSWORD}'; flush privileges;"
service mysql restart

