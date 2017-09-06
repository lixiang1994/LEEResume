# LEEResume

一个非常棒的简历主题


----


## 准备



快速安装Docker并启动运行.

```
curl -sSL https://get.docker.com/ | sh
```

1. 将git下载到服务器

```
wget https://github.com/lixiang1994/LEEResume/archive/master.zip
```

2. 解压

```
unzip master.zip
```

## 常用命令


查看Docker镜像

```
docker images
```

查看Docker容器列表

```
docker ps
```

删除Docker镜像 (9f13d494d0c7代表镜像ID)

```
docker rmi 9f13d494d0c7
```

删除Docker容器 (5f84e6736be9代表容器ID)

```
docker rm 5f84e6736be9
```

重启Docker容器 (5f84e6736be9代表容器ID)

```
docker restart 5f84e6736be9
```

停止Docker容器 (5f84e6736be9代表容器ID)

```
docker stop 5f84e6736be9
```

帮助 更多命令可以自行参考

```
docker --help
```

## 开始


添加Alpine基础镜像并进入交互环境

```
docker pull alpine

docker run -it alpine /bin/sh
```

为了方便在国内使用, 首先修改/etc/apk/repositories文件:

```
vi /etc/apk/repositories
```

把默认的源改为ustc的(很重要 官方源在国内速度太慢了)：

```
https://mirrors.ustc.edu.cn/alpine/v3.6/main
https://mirrors.ustc.edu.cn/alpine/v3.6/community
```

修改完成后 :wq! 保存退出.

接下来就是安装我们需要的包


```
apk update
```
 
```
apk add --no-cache -u --virtual build curl zip
```
 
```
apk add --no-cache nginx ca-certificates \
php7-fpm \
php7-mbstring \
php7-json \
php7-session \
php7-zlib \
php7-xml \
php7-xmlreader \
php7-pdo \
php7-phar \
php7-openssl \
php7-gd \
php7-iconv \
php7-mcrypt \
php7-ctype \
php7-zip \
php7-curl \
php7-opcache \
php7-apcu \
php7-intl \
php7-bcmath \
php7-dom
```


全部完成后输入`Exit` 退出交互环境.

这时查询Docker正在运行的容器 获取到刚才容器的ID 通过刚刚的容器ID创建新的镜像 (9f13d494d0c7是我当时的容器ID)

```
docker commit 9f13d494d0c7 alpine-resume
```

现在我们就有了简历的基础镜像了, 接下来就可以开始创建简历的镜像了:

1. 进入存放`Dockerfile`文件的目录下 (我这里是放到了根目录)
2. 执行创建镜像命令:
    ```
    docker build -t lee/resume .
    ```

3.创建成功后 可以运行`docker images`命令查看一下刚刚创建的镜像


最后一步, 运行脚本 让简历镜像在容器中运行:

```
sh start.h
```

## 相关

该主题参考自[grav-theme-resume](https://github.com/getgrav/grav-theme-resume) 并在其基础上做了优化和调整.

