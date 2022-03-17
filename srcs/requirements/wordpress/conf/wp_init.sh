# Install WP-CLI 
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# # Install and config Wordpres s
# wp core download --locale=fr_FR
# wp core config --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PWD} --dbhost=${DB_ROOT} --dbprefix=${TABLE_PREFIX}
# wp core install --url=${DOMAIN} --title=${TITLE} --admin_user=${WP_DB_HOST} --admin_password=${WP_HOST_PSW} --admin_email=${EMAIL_ADRESS}
# wp user create ${WP_DB_USER} ${EMAIL_ADRESS} --role=subscriber --user_pass=${WP_USER_PWD}


exec php-fpm7.3 --nodaemonize