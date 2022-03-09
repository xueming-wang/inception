 #MariaDB uniquement sans nginx.

FROM debian:buster

ARG DB_ROOT_PSW
ARG DB_NAME
ARG DB_USER
ARG DB_USER_PWD


# 指定接下里的工作路径为/tmp
WORKDIR /APP

COPY ./conf/* .


RUN apt-get update \
    && apt-get -y install mariadb-client mariadb-server 
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN service mysql start

RUN chmod 777 ./db_init.sh

# RUN ./db_init.sh

# #声明端口。帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射。 :3306
EXPOSE 3306

RUN sh ./db_init.sh

# CMD exec mysqld_safe

CMD /usr/bin/mysqld_safe