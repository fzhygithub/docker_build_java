``` 
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/fzhygithub/tomcat_local_mvn_withm2.git
git push -u origin master


FROM maven:3.5-jdk-8

COPY . /root/
CMD  mv m2 .m2 &&  mvn clean package
WORKDIR /root/

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]


#docker build -t helloworld .
#docker run -d --name hellworld -p 8080:8080 helloworld
```
