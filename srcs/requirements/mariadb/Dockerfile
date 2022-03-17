 #MariaDB uniquement sans nginx.

FROM debian:buster

ARG DB_HOST_PSW
ARG DB_NAME
ARG DB_USER
ARG DB_USER_PWD
ARG DB_HOST


# 指定接下里的工作路径为/tmp
WORKDIR /APP

COPY ./conf/* .


RUN apt-get update \
    && apt-get -y install mariadb-server 



RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

# #声明端口。帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射。 :3306
EXPOSE 3306


