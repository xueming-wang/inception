#Un container Docker contenant WordPress + php-fpm (installé et configuré) uni- quement sans nginx.
#两位用户将出现在您的 WordPress 数据库中
FROM debian:buster

WORKDIR /APP

COPY ./conf/* .

# install wordpress
# 下载配置wordpress
RUN apt-get update \
    && apt-get -y install wget \
    && wget http://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \
    && mkdir /var/www/ \
    && mv wordpress /var/www/ \
    && cp ./wp-config.php  /var/www/wordpress/ \
    && chown -R www-data: /var/www/wordpress/

# #下载配置phpmadmin
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz \
#     && tar -xvzf phpMyAdmin-5.1.0-all-languages.tar.gz \
#     && mv phpMyAdmin-5.1.0-all-languages /var/www/site/phpmyadmin \
#     && mv /tmp/srcs/config.inc.php /var/www/site/phpmyadmin \
#     && chown -R www-data: /var/www/site/phpmyadmin
    

EXPOSE 9000 

#CMD [ "" ]