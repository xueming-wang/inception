#NGINX avec TLSv1.2 ou TLSv1.3 uniquement.

#Le container devra tourner avec Debian Buster.
FROM debian:buster 

WORKDIR /APP

COPY ./conf/* /APP/

# Create website folder 
RUN mkdir -p /var/www/website

RUN apt-get update \
    && apt-get -y install openssl \      
    && apt-get -y install wget \      
    && apt-get -y install nginx

# Get SSL certification
RUN mkdir /etc/nginx/ssl \
 && openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout /etc/nginx/ssl/xuwangkey.key \
    -out /etc/nginx/ssl/xuwang.csr -subj '/C=FR/ST=75/P=Paris/O=42/CN=xuwang'

# 配置nginx
RUN rm -rf /etc/nginx/sites-enabled/default \
    && cp ./nginx.conf /etc/nginx/sites-available \
    && ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ \
    && chown -R www-data /var/www/* \
    && chmod -R 755 /var/www/*

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


