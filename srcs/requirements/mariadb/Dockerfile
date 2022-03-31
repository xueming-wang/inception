 #MariaDB uniquement sans nginx.

FROM debian:buster

ARG DB_HOST_PSW
ARG DB_NAME
ARG DB_USER
ARG DB_USER_PWD
ARG DB_HOST


WORKDIR /APP

COPY ./conf/* /APP/


RUN apt-get update \
    && apt upgrade -y \
    && apt-get -y install mariadb-server


RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf


EXPOSE 3306

RUN chmod 755 ./script.sh
RUN ./script.sh

CMD /usr/bin/mysqld_safe