# docker-smokeping
smokeping container

# 启动

`docker run -d -p 80:80 --name smokeping jasonlix/docker-smokeping`

# 修改时区

> 默认为`Asia/Shanghai`时区，可通过以下命令更改你需要的时区。

```shell
docker exec smokeping rm -f /etc/localtime
docker exec smokeping ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

# 更改smokeping配置文件

进入smokeping容器里：
`docker exec -it smokeping bash`

进入smokeping配置目录：
`cd /etc/smokeping/config.d/`

使用`vim`修改配置文件。

重启smokeping服务：
`/etc/init.d/smokeping restart`

退出smokeping容器：
`exit`

----------------------

> 你也可以在启动smokeping容器时，将你的smokeping配置文件挂载进容器里：  
> `docker run -d -p 80:80 --name smokeping -v /etc/smokeping:/etc/smokeping jasonlix/docker-smokeping`

----------------------