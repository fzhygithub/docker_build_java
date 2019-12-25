# Builder container
FROM maven:3.5-jdk-8 AS builder

COPY . /root/
WORKDIR /root/
RUN  mv  m2 .m2
RUN mvn clean package


# Runner container
FROM tomcat:8.5.29-jre8
#FROM gcr.io/distroless/java
#FROM openjdk:8-jre-alpine
COPY --from=builder /root/target/docker-demo.war /usr/local/tomcat/webapps/docker-demo.war
#ADD target/docker-demo.war /usr/local/tomcat/webapps/

### run ###
EXPOSE 8080
#ENTRYPOINT ["java","-jar","/usr/src/app/target/spring-boot-docker-1.0.0.jar"]
CMD ["catalina.sh", "run"]


#docker build -t hellojava .
#docker run -d --name hellojava -p 8080:8080 hellojava
