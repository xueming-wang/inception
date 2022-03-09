service mysql start
sleep 3

mysql -e "create database ${DB_NAME};"
sleep 3

mysql -e "create user ${DB_USER}@'%' identified by '${DB_USER_PWD}';"
sleep 3

mysql -e "grant all privileges on ${DB_NAME}.* to '${DB_USER}'@'%'; flush privileges;"
sleep 3

mysql -e "alter user  'root'@'localhost' identified by '${DB_ROOT_PSW}'; 
flush privileges;"


# echo "create database ${MARIADB_DATABASE};" | mysql -u root
# echo "create user  '${MARIADB_USER}'@'%' identified by ${MARIADB_PASSWORD};" | mysql -u root
# echo "grant all privileges on ${MARIADB_DATABASE}.* to '${MARIADB_USER}'@'%' with grant option;" | mysql -u root
# echo "flush privileges" | mysql -u root




