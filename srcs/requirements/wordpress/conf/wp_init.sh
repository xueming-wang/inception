# # Install WP-CLI 
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# # Install and config Wordpres s

# wp core download --locale=fr_FR
# wp core config --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=${MARIADB_ROOT_PASSWORD} --dbprefix=${TABLE_PREFIX}
# wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WORDPRESS_DB_HOS} --admin_password=${WORDPRESS_HOST_PSW} --admin_email=${EMAIL_ADRESS}
# wp user create ${WORDPRESS_DB_USER} ${EMAIL_ADRESS} --role=subscriber --user_pass=${WORDPRESS_DB_ASSWORD}
# mysql -u root -p

exec php-fpm7.3 --nodaemonize