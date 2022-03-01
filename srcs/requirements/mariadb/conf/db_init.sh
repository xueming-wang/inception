#!/bin/bash

# 启动
mysql_install_db --user=mysql
sleep 3
mysqld_safe &
sleep 3
mysqladmin -u "$MARIADB_USER" password "$MARIADB_PASSWORD"

# 授权
mysql -u "$MARIADB_USER" -p"$MARIADB_PASSWORD" -e "use mysql; grant all privileges on *.* to '$MARIADB_USER'@'%' identified by 
'$MARIADB_PASSWORD' with grant option;"

h=$(hostname)

# 设置用户密码
mysql -u "$MARIADB_USER" -p"$MARIADB_PASSWORD" -e "use mysql; update user set password=password('$MARIADB_PASSWORD') where user='$M
ARIADB_USER' and host='$h';"

# 创建默认数据库
#mysql -u "$MARIADB_USER" -p"$MARIADB_PASS" -e "CREATE DATABASE IF NOT EXISTS default_db DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"

# 刷新权限
mysql -u "$MARIADB_USER" -p"$MARIADB_PASSWORD" -e "flush privileges;"