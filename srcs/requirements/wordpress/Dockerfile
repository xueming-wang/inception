#Un container Docker contenant WordPress + php-fpm (installé et configuré) uni- quement sans nginx.
#两位用户将出现在您的 WordPress 数据库中
FROM debian:buster

WORKDIR /APP

COPY ./conf/* .

# install wordpress
# 下载配置wordpress
RUN apt-get update \
    && apt-get install -y wget \
                            openssl \
                            vim

# Install PHP #
RUN apt-get install -y php7.3-fpm \
                        php7.3-common \
                        php7.3-json \
                        php7.3-gd \
                        php7.3-cli \
                        php7.3-mbstring \
                        php7.3-xml \
                        php7.3-opcache \
                        php7.3-mysql \
                        php7.3-bcmath \
                        php7.3-zip

# RUN sed 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' -i /etc/php/7.3/fpm/pool.d/www.conf

RUN rm /etc/php/7.3/fpm/pool.d/www.conf \
    && cp ./www.conf /etc/php/7.3/fpm/pool.d/
RUN wget https://cn.wordpress.org/latest-zh_CN.tar.gz \
    &&  tar -xzvf latest-zh_CN.tar.gz \
    && mkdir -p /var/www/website/ \
    && mv wordpress /var/www/website/ \
    && cp ./wp-config.php /var/www/website/wordpress/ \
    && chown -R www-data:www-data /var/www/website/wordpress/

#下载配置phpmadmin 
#转变文件拥有者 若是整个目次下的都改



EXPOSE 9000 


# #启动时运行
CMD sh ./wp_init.sh
