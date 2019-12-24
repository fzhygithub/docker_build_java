FROM tomcat:8.5.29-jre8

COPY . /root/
CMD  mv m2 .m2 &&  mvn clean package
WORKDIR /root/

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]


#docker build -t hellojava .
#docker run -d --name hellojava -p 8080:8080 hellojava
