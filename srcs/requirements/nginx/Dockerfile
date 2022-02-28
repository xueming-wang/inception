#NGINX avec TLSv1.2 ou TLSv1.3 uniquement.

#指定使用哪个镜像源   基于Linux下Debian系统 容器在这个系统内运行  Le container devra tourner avec Debian Buster.
FROM debian:buster  

# 指定接下里的工作路径为/tmp
WORKDIR /APP

# 复制当前所有文件包括文件夹到容器里的/tmp文件夹里
COPY ./conf/* .

# 安装wgetnginx ph mariadb p  #mettre en place un serveur web avec Nginx使用nginx设置服务器
#openssl：Open Secure Sockets Layer
#wget 是一个从网络上自动下载文件的自由工具
#openssl TLSv1.2
# Create website folder 
RUN mkdir -p /var/www/html

RUN apt-get update \
    && apt-get -y install openssl \      
    && apt-get -y install wget \      
    && apt-get -y install nginx

# Get SSL certification
#RUN mkdir /etc/nginx/ssl
ARG DOMAIN_NAME

RUN openssl req \
        -x509 \
        -newkey rsa:4096 \
        -sha256 \
        -nodes \
        -keyout /etc/nginx/ssl/key.pem \
        -out /etc/nginx/ssl/cert.pem \
        -days 3650 \
        -subj "/CN=FR/ST=Paris/L=Paris/O=42/OU=42/CN=xuwang" -keyout /etc/ssl/certs/${DOMAIN_NAME}.key -out /etc/ssl/certs/${DOMAIN_NAME}.crt


# 配置nginx
RUN rm -rf /etc/nginx/sites-enabled/default \
    && cp ./nginx.conf /etc/nginx/sites-available \
    && ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ \
    && chown -R www-data /var/www/* \
    && chmod -R 755 /var/www/*
    #ln -s为某一个文件在另外一个位置建立一个同步的链接

#RUN service nginx start
#运行容器时执行的shell环境
# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

#指定容器挂载点到宿主机自动生成的目录或其他容器
#VOLUME 
# Open https port
EXPOSE 443

