# docker-smokeping
smokeping container

# 启动 Smokeping Master

> `ZONE`变量为时区，请更改为你当地的时区。

`docker run -d -p 80:80 --name smokeping -e ZONE="Asia/Shanghai" jasonlix/docker-smokeping`

## 更改smokeping配置文件

进入smokeping容器里：
`docker exec -it smokeping bash`

进入smokeping配置目录：
`cd /etc/smokeping/config.d/`

使用`vim`修改配置文件。

重启smokeping服务：
`/etc/init.d/smokeping restart`

退出smokeping容器：
`exit`

> 你也可以在启动smokeping容器时，将你的smokeping配置文件挂载进容器里：  
> `docker run -d -p 80:80 --name smokeping -e ZONE="Asia/Shanghai" -v /etc/smokeping:/etc/smokeping jasonlix/docker-smokeping`

----------------------

# 启动 Smokeping Slave

> `ZONE`：配置时区  
> `SECRET`：smokeping slave的密码

`docker run -d --name smokeping_slave -e ZONE="Asia/Shanghai" -e SECRET="password" jasonlix/docker-smokeping smokeping --master-url=http://**Your_master_server_ip**/smokeping.cgi --cache-dir=/var/lib/smokeping/ --shared-secret=/etc/smokeping/smokeping_secrets --slave-name=**slave_name** --nodaemon`

----------------------