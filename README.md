# LEEResume
简历


无Docker需安装Docker并启动运行.

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

3. 创建Docker镜像 (耗时一段时间)

```
cd LEEResume-master

docker build -t lee/resume .

```

4. 查看镜像

```
docker images
```

5. 运行start.sh脚本 启动镜像

```
sh start.sh
```


查看Docker运行列表

```
docker ps
```
