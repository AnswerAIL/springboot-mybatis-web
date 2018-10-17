FROM java:8
ENV MYSQL_DB answer
ENV MYSQL_IP 119.23.XXX.XXX
ENV MYSQL_PASSWD 123456
ENV MYSQL_PORT 3306
ENV MYSQL_UNAME root
ADD /springboot-mybatis-web-1.0.0.jar //
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "/springboot-mybatis-web-1.0.0.jar"]
VOLUME ["/root/answer/docker/data/", "/home"]