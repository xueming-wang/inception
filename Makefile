# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xuwang <xuwang@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/21 15:15:41 by xuwang            #+#    #+#              #
#    Updated: 2022/03/08 15:45:10 by xuwang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=inception

all = $(NAME)

clean:
		docker-compose down
		docker stop $(docker ps -a -q)
		docker rm $(docker ps -a -q)
		docker rmi $(docker images -q)
	
.PHONY: clean
#镜像（Image）：Docker 镜像（Image），就相当于是一个 root 文件系统
#Dockerfile是一个用来构建镜像的文本文件 读取Dockerfile中的指令自动生成映像。
#容器（Container）：镜像（Image）和容器（Container）的关系，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。 容器通过镜像来创建
#仓库（Repository）：仓库可看成一个代码控制中心，用来保存镜像  
#容器使用
#获取镜像:如果我们本地没有 ubuntu 镜像，我们可以使用 docker pull 命令来载入 ubuntu 镜像：docker pull ubuntu
#启动容器:以下命令使用 ubuntu 镜像启动一个容器 :docker run -it ubuntu /bin/bash
#docker logs 命令，查看容器内的标准输出：docker logs ID  #docker stop 命令来停止容器 docker ps 查看，容器已经停止工作
# docker start 启动一个已停止的容器 , 查看所有的容器命令如下：docker ps -a
#停止容器的命令如下：docker stop <容器 ID>  docker restart 重启：docker restart <容器 ID>
# -d 参数时，容器启动后会进入后台 此时想要进入容器，可以通过以下指令进入： docker exec : docker exec -it 243c32535da7 /bin/bash
#导出本地某个容器，可以使用 docker export 命令。 例如 ：导出容器 1e560fca3906 快照到本地文件 ubuntu.tar。docker export 1e560fca3906 > ubuntu.tar
#导入容器快照  docker import ：  cat docker/ubuntu.tar | docker import - test/ubuntu:v1 或者指定 URL 或者某个目录来导入docker import
#删除容器使用 docker rm 命令： docker rm -f ID 下面的命令可以清理掉所有处于终止状态的容器：docker container prune
##  docker pull training/webapp载入镜像
#PORTS 0.0.0.0:32769->5000/tcp 这时我们可以通过浏览器访问WEB应用
# -p 参数来设置不一样的端口：docker run -d -p 5000:5000 training/webapp python app.py
#docker port 可以查看指定 （ID 或者名字）容器的某个确定端口映射到宿主机的端口号。docker port bf08b7f2cd89 或 docker port wizardly_chandrasekhar 来查看容器端口的映射情况。




#镜像使用
#使用的镜像如果在本地中不存在，docker 就会自动从 docker 镜像仓库中下载，默认是从 Docker Hub 公共镜像源下载。
#docker images 来列出本地主机上的镜像。
#REPOSITORY：表示镜像的仓库源
#TAG：镜像的标签
#IMAGE ID：镜像ID
#CREATED：镜像创建时间
#SIZE：镜像大小
#我们如果要使用版本为15.10的ubuntu系统镜像来运行容器时  docker run -t -i ubuntu:15.10 /bin/bash 
 #-i: 交互式操作。-t: 终端。这是指用 ubuntu 15.10 版本镜像为基础来启动容器。放在镜像名后的是命令，这里我们希望有个交互式 Shell，因此用的是 /bin/bash。
##我们在本地主机上使用一个不存在的镜像时 Docker 就会自动下载这个镜像。如果我们想预先下载这个镜像，我们可以使用 docker pull 命令来下载它。下载完成后，我们可以直接使用这个镜像来运行容器。
#镜像删除使用 docker rmi 命令，比如我们删除 hello-world 镜像：docker rmi hello-world
#使用 Dockerfile 指令来创建一个新的镜像 在运行的容器内使用 apt-get update 命令进行更新。
#我们可以通过命令 docker commit 来提交容器副本。docker commit -m="has update" -a="runoob" e218edb10161 runoob/ubuntu:v2
#构建镜像 !!!!!我们使用命令 docker build ， 从零开始来创建一个新的镜像。为此，我们需要创建一个 Dockerfile 文件，其中包含一组指令来告诉 Docker 如何构建我们的镜像。
#运行 docker build -t runoob/centos:6.7 . docker build 命令来构建一个镜像。 -t ：指定要创建的目标镜像名 . ：Dockerfile 文件所在目录，如果未说明最后一个参数，那么默认上下文路径就是 Dockerfile 所在的位置。可以指定Dockerfile 的绝对路径，  6.7是tag名字
#创建容器 docker run -t -i runoob/centos:6.7  /bin/bash
#docker tag 命令，为镜像添加一个新的标签。docker tag 860c279d2fec !!runoob/centos:dev 镜像源名(repository name):新的标签名(tag)。


#Docker Compose
#使用 Dockerfile 定义应用程序的环境
#使用 docker-compose.yml 定义构成应用程序的服务，这样它们可以在隔离环境中一起运行。
#最后，执行 docker-compose up 命令来启动并运行整个应用程序。 docker-compose --version