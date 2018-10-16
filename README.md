# SpringBoot-Mybatis-Web
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