#NGINX avec TLSv1.2 ou TLSv1.3 uniquement.

#指定使用哪个镜像源   Le container devra tourner avec Debian Buster.
FROM debian:buster  

# 指定接下里的工作路径为/APP
WORKDIR /APP

# 复制当前所有文件包括文件夹到容器里的/APP文件夹里
COPY ./conf/* .

#openssl：Open Secure Sockets Layer
# Create website folder 
RUN mkdir -p /var/www/website

RUN apt-get update \
    && apt-get -y install openssl \      
    && apt-get -y install wget \      
    && apt-get -y install nginx

# Get SSL certification
RUN mkdir /etc/nginx/ssl \
 && openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout /etc/nginx/ssl/xuwangkey.key \
    -out /etc/nginx/ssl/xuwang.csr -subj '/C=FR/ST=69/P=Paris/O=42/CN=tdayde'

# 配置nginx
RUN rm -rf /etc/nginx/sites-enabled/default \
    && cp ./nginx.conf /etc/nginx/sites-available \
    && ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ \
    && chown -R www-data /var/www/* \
    && chmod -R 755 /var/www/*

EXPOSE 443
#容器启动时要执行的命令

# CMD ["nginx", "-g", "daemon off;"]
# ENTRYPOINT  service nginx restart &&\
#  			bash
CMD ["nginx", "-g", "daemon off;"]
# CMD sh ./init.sh


