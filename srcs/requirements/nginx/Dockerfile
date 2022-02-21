#NGINX avec TLSv1.2 ou TLSv1.3 uniquement.

#指定使用哪个镜像源   基于Linux下Debian系统 容器在这个系统内运行  Le container devra tourner avec Debian Buster.
FROM debian:buster  
# 复制当前所有文件包括文件夹到容器里的/tmp文件夹里
COPY . /tmp 
# 指定接下里的工作路径为/tmp
WORKDIR /tmp

# 安装wgetnginx ph mariadb p  #mettre en place un serveur web avec Nginx使用nginx设置服务器
RUN apt-get update \
    && apt-get -y install nginx

# 配置nginx
RUN rm -rf /etc/nginx/sites-enabled/default \
    && cp /tmp/srcs/mynginxconf /etc/nginx/sites-available \
    && ln -s /etc/nginx/sites-available/mynginxconf /etc/nginx/sites-enabled/

#运行容器时执行的shell环境
CMD bash ./srcs/init.sh

#指定容器挂载点到宿主机自动生成的目录或其他容器
#VOLUME 
