# SpringBoot-MyBatis-Web
  - SpringBoot实现基础Web框架

### 新建项目步骤(以IDEA为例)
  1. File -> New -> Project -> Spring Initializr -> Next(选择JDK版本)
  2. 设置 Group 和 Artifact 值
      - Group: com.answer  域.公司名称
          - 域： com(商业组织) org(非营利组织)
      - Artifact: springboot-mybatis-web    项目名称
          
### 启动服务
```bash
    nohup java -jar springboot-mybatis-web-0.0.1-SNAPSHOT.jar >> smw.log 2>&1 &
``` 

&nbsp;
    
### 服务器构建项目镜像
```bash
    # 在POM中声明构建信息: pom_pom.xml  使用Dockerfile: pom.xml + Dockerfile
    
    # 进入项目目录
    cd /root/answer/docker/springboot-mybatis-web
    # 编译 Docker 镜像
    mvn package docker:build -Dmaven.test.skip=true -X
    # 启动一个容器实例
    docker run -d -p 8088:8888 -v /root/answer/docker/data:/home --name smw IMAGE_ID
```         

&nbsp;

***
### 如果觉得该项目对你有帮助， 请随意打赏， 谢谢支持
##### [微信](https://github.com/AnswerAIL/answer-ai-repositories/blob/master/pay/wx.jpg)
<img src="https://github.com/AnswerAIL/answer-ai-repositories/blob/master/pay/wx.jpg"  height="230" width="240">

&nbsp;

##### [支付宝](https://github.com/AnswerAIL/answer-ai-repositories/blob/master/pay/zfb.png)
<img src="https://github.com/AnswerAIL/answer-ai-repositories/blob/master/pay/zfb.png"  height="230" width="240">
