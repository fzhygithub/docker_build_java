FROM tomcat:8.5.29-jre8

COPY . /usr/local/tomcat/webapps/ROOT/
CMD  mv m2 .m2 &&  mvn clean package
WORKDIR /root/

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]


#docker build -t helloworld .
#docker run -d --name helloworld -p 8080:8080 helloworld
