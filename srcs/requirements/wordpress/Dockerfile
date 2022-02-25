#Un container Docker contenant WordPress + php-fpm (installé et configuré) uni- quement sans nginx.
FROM debian:buster

COPY ./conf .

WORKDIR /conf

# install wordpress
RUN apt-get update \
    && apt-get install -y php-fpm php-mysql
    # && apt-get -y install php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache \
    # && php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl

RUN mkdir -p /run/php

#PHP CONF
RUN mv conf/wp-config.php  

EXPOSE 9000 

CMD [ "" ]