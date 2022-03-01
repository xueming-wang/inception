 #MariaDB uniquement sans nginx.

FROM debian:buster

# 指定接下里的工作路径为/tmp
WORKDIR /APP

# 复制当前所有文件包括文件夹到容器里的/tmp文件夹里
COPY ./conf .

RUN apt-get update \
    && apt-get -y install mariadb-client mariadb-server 

# 配置数据管理系统
RUN service mariadb start \
    && echo "create database wordpress;" | mysql -u root  \
    && echo "create user 'wordpress'@'%';" | mysql -u root \
    && echo "grant all privileges on wordpress.* to 'wordpress'@'%' with grant option;" | mysql -u root \
    && echo "flush privileges;" | mysql -u root
 
#声明端口。帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射。
EXPOSE 3306







#USER
#CMD bash ./srcs/init.sh
#启动容器时执行的Shell命令 启动容器时执行的脚本文件 CMD 在docker run 时运行。RUN 是在 docker build。
#作用：为启动的容器指定默认要运行的程序，程序运行结束，容器也就结束。CMD 指令指定的程序可被 docker run 命令行参数中指定要运行的程序所覆盖。
#ENTRYPOINT：类似于 CMD 指令优点：在执行 docker run 的时候可以指定 ENTRYPOINT 运行所需的参数。可以搭配 CMD 命令使用：一般是变参才会使用 CMD 
#运行 docker build -t runoob/centos:6.7 . docker build 命令来构建一个镜像。 -t ：指定要创建的目标镜像名 . ：Dockerfile 文件所在目录，可以指定Dockerfile 的绝对路径
#创建容器 docker run -t -i runoob/centos:6.7  /bin/bash
#docker tag 命令，为镜像添加一个新的标签。docker tag 860c279d2fec !!runoob/centos:dev 镜像源名(repository name):新的标签名(tag)。