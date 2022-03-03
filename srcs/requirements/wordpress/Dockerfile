#Un container Docker contenant WordPress + php-fpm (installé et configuré) uni- quement sans nginx.
#两位用户将出现在您的 WordPress 数据库中
FROM debian:buster

WORKDIR /APP

COPY ./conf/* .

# install wordpress
# 下载配置wordpress
RUN apt-get update \
    && apt-get -y install wget \
    && apt-get -y install php7.3 php7.3-fpm php7.3-mysql php7.3-curl php7.3-gd \
     php7.3-mbstring php7.3-xml php7.3-xmlrpc php7.3-zip php7.3-opcache php7.3-json  php7.3-pgsql

# RUN apt-get update \
#     && apt-get -y install wget 
    # && apt-get -y install php7.3-fpm \
    #     php7.3-common \
    #     php7.3-json \
    #     php7.3-gd \
    #     php7.3-cli \
    #     php7.3-mbstring \
    #     php7.3-xml \
    #     php7.3-opcache \
    #     php7.3-mysql \
    #     php7.3-bcmath \
    #     php7.3-zip 

  RUN wget https://cn.wordpress.org/latest-zh_CN.tar.gz \
     && tar -xzvf latest-zh_CN.tar.gz \
     && mkdir -p /var/www/website/ \
     && mv wordpress /var/www/website/ \
    && cp ./wp-config.php /var/www/website/wordpress/ \
    && chown -R www-data: /var/www/website/wordpress/


#下载配置phpmadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz \
    && tar -xvzf phpMyAdmin-5.1.0-all-languages.tar.gz \
    && mv phpMyAdmin-5.1.0-all-languages  /var/www/website/phpmyadmin/ \
    && cp ./config.inc.php /var/www/website/phpmyadmin/ \
    && chmod -R 755 /var/www/website/phpmyadmin/ \
    && chown -R www-data: /var/www/website/phpmyadmin
    

EXPOSE 9000 

#启动时运行
CMD service php7.3-fpm restart 

