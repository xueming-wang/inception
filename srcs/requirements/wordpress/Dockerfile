#Un container Docker contenant WordPress + php-fpm (installé et configuré) uni- quement sans nginx.
FROM debian:buster

WORKDIR /APP

COPY ./conf/* /APP/


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

RUN  cp ./www.conf /etc/php/7.3/fpm/pool.d/
 
# install wordpress
RUN wget https://fr.wordpress.org/wordpress-5.9.2-fr_FR.tar.gz \
    && tar -xzvf wordpress-5.9.2-fr_FR.tar.gz \
    && mkdir -p /var/www/website/ \
    && mv wordpress /var/www/website/ \
    && cp ./wp-config.php /var/www/website/wordpress/ \
    && chown -R www-data:www-data /var/www/website/wordpress/ \
    && service php7.3-fpm start

EXPOSE 9000 

ENTRYPOINT ["sh","wp_init.sh"]
