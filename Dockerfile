FROM maven:3.5-jdk-8

COPY . /root/
CMD  mv m2 .m2 &&  mvn clean package
WORKDIR /root/

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]


#docker build -t helloworld .
#docker run -d --name hellworld -p 8080:8080 helloworld
