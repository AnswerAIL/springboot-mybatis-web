# 集成 Docker 实现项目容器化脚本部署
  - [x] V 1.0： 集成 Docker 实现项目容器化脚本部署
  - [x] V 2.0： 在V 1.0的基础上提取环境变量值
  - [x] V 3.0： 在V 2.0的基础上加入Nginx实现简单的集群负载均衡
    - 访问地址: http://NGINX_IP:NGINX_PORT/


### 文件目录说明(V 1.0 & V 2.0)
```bash
    # 1. 实例化 MySQL 容器启动时自动执行脚本.    *.sh | *.sql | *.sql.gz
    auto-script
      - init_tables.sql   # 初始化数据库表结构
      - init_account.sql  # 初始化数据库账户, 默认账户名: docker 密码: 123456
    
    # 2. 持久化本地挂载目录, 注意该目录不可被删除, 否则容器内部的数据也将被同步移除(脚本中会自动生成)
    data
      - mysql     # MySQL 数据库持久化数据本地存储目录
      - web       # Web 数据持久化本地存储目录
        
    # 3. 持久化数据备份目录, 在重启服务是会用到(脚本中会自动生成)
    dataBak           
    
    # 4. 服务编排文件信息
    docker-compose.yaml
    
    # 5. 服务启动日志存储目录(脚本中会自动生成)
    logs
      - smw.log
    
    # 6. 环境变量配置文件(V 2.0中用到)
    .env
    
    # 7. 服务启动脚本
    start.sh
```
`注意: 启动项目前, 请先构建 springboot-mybatis-web 项目镜像`



### 文件目录说明(V 3.0)
```bash
    # 1. 初始化脚本文件
    auto-script
      - mysql
        - init_account.sql
        - init_tables.sql
      - nginx
        - html/index.html       # nginx 首页页面
        - nginx.conf            # nginx 配置文件
        
    # 2. 服务编排文件信息
    docker-compose.yaml
    
    # 3. 环境变量配置文件
    .env
    
    # 4. 服务启动脚本
    start.sh
    
    # 5. 持久化本地挂载目录
    data
    
    # 6. 持久化数据备份目录
    dataBak
    
    # 7. 服务启动日志存储目录
    logs
      - smw.log
```