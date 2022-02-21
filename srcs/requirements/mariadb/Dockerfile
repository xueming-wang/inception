 #MariaDB uniquement sans nginx.
 
 #指定使用哪个镜像源   基于Linux下Debian系统 容器在这个系统内运行  Le container devra tourner avec Debian Buster.
FROM debian:buster  
# 复制当前所有文件包括文件夹到容器里的/tmp文件夹里
COPY . /tmp 
# 指定接下里的工作路径为/tmp
WORKDIR /tmp

# 安装wget mariadb nginx php  #mettre en place un serveur web avec Nginx使用nginx设置服务器
RUN apt-get update \
    && apt-get -y install openssl \
    && apt-get -y install wget \
    && apt-get -y install mariadb-client mariadb-server \
    && apt-get -y install nginx \                     
    && apt-get -y install php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache \
    php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl

# 配置叫wordpress的数据管理系统
    # 创建数据库
    # 创建数据库用户 : % -> 任何主机都可以访问
    # 给予用户权限
    # 更新信息 
RUN service mysql start \
    && echo "create database wordpress;" | mysql -u root  \
    && echo "create user 'wordpress'@'%';" | mysql -u root \
    && echo "grant all privileges on wordpress.* to 'wordpress'@'%' with grant option;" | mysql -u root \
    && echo "flush privileges;" | mysql -u root

# 下载配置phpmadmin
RUN mkdir /var/www/site/ \
    && wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz \
    && tar -xvzf phpMyAdmin-5.1.0-all-languages.tar.gz \
    && mv phpMyAdmin-5.1.0-all-languages /var/www/site/phpmyadmin \
    && mv /tmp/srcs/config.inc.php /var/www/site/phpmyadmin \
    && chown -R www-data: /var/www/site/phpmyadmin


# 下载配置wordpress
RUN wget http://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \    
    && mv wordpress /var/www/site/wordpress \
    && mv /tmp/srcs/wp-config.php /var/www/site/wordpress \
    && chown -R www-data: /var/www/site/wordpress

# 配置nginx
RUN rm -rf /etc/nginx/sites-enabled/default \
    && cp /tmp/srcs/mynginxconf /etc/nginx/sites-available \
    && ln -s /etc/nginx/sites-available/mynginxconf /etc/nginx/sites-enabled/

#设置环境变量，定义了环境变量，那么在后续的指令中，就可以使用这个环境变量。
ENV <key> <value>
ENV <key1>=<value1> <key2>=<value2>...

#构建参数，与 ENV 作用一致 docker build 的过程中有效 构建好的镜像内不存在此环境变量。
ARG <参数名>[=<默认值>]

#声明端口。帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射。
#EXPOSE 

#用于指定执行后续命令的用户和用户组
USER <用户名>[:<用户组>]

#HEALTHCHECK
#HEALTHCHECK [option] CMD <命令>：设置检查容器健康状况的命令




#USER
#CMD bash ./srcs/init.sh
#启动容器时执行的Shell命令 启动容器时执行的脚本文件 CMD 在docker run 时运行。RUN 是在 docker build。
#作用：为启动的容器指定默认要运行的程序，程序运行结束，容器也就结束。CMD 指令指定的程序可被 docker run 命令行参数中指定要运行的程序所覆盖。
#ENTRYPOINT：类似于 CMD 指令优点：在执行 docker run 的时候可以指定 ENTRYPOINT 运行所需的参数。可以搭配 CMD 命令使用：一般是变参才会使用 CMD 
#运行 docker build -t runoob/centos:6.7 . docker build 命令来构建一个镜像。 -t ：指定要创建的目标镜像名 . ：Dockerfile 文件所在目录，可以指定Dockerfile 的绝对路径
#创建容器 docker run -t -i runoob/centos:6.7  /bin/bash
#docker tag 命令，为镜像添加一个新的标签。docker tag 860c279d2fec !!runoob/centos:dev 镜像源名(repository name):新的标签名(tag)。