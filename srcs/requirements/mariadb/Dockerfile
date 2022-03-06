 #MariaDB uniquement sans nginx.

FROM debian:buster

ENV MARIADB_ROOT_PASSWORD=mariadberoot
ENV MARIADB_DATABASE=wordpress     
ENV MARIADB_USER=xuwang    
ENV MARIADB_PASSWORD=mypassword


# 指定接下里的工作路径为/tmp
WORKDIR /APP

COPY ./conf/* .
# 复制当前所有文件包括文件夹到容器里的/tmp文件夹里


 # 更新yum源及安装mariadb
RUN apt-get update \
    && apt-get -y install mariadb-client mariadb-server 

# RUN service mysql start

RUN chmod 777 ./db_init.sh

RUN ./db_init.sh

# #声明端口。帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射。 :3306
EXPOSE 3306  

# CMD /usr/bin/mysqld_safe

