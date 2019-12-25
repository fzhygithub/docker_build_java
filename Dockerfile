# Builder container
FROM maven:3.5-jdk-8 AS builder

COPY . /root/
WORKDIR /root/
RUN mv m2 .m2 && mvn clean package


# Runner container
FROM tomcat:8.5.29-jre8
#FROM gcr.io/distroless/java
#FROM openjdk:8-jre-alpine
COPY --from=builder /root/target/docker-demo.war /usr/local/tomcat/webapps/docker-demo.war
#ADD target/docker-demo.war /usr/local/tomcat/webapps/
CMD echo "Asia/Shanghai" > /etc/timezone
ENV TIME_ZONE Asia/Shanghai

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]
#CMD ["java", "-jar", "/usr/local/tomcat/webapps/docker-demo.war"]
#CMD ["catalina.sh", "run"] && tail -f /usr/local/tomcat/logs/catalina.out


#docker build -t hellojava .
#docker run -d --name hellojava -p 8080:8080 hellojava
#http://localhost:8080/docker-demo/
