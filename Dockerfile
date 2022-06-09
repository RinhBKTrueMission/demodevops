FROM tomcat:latest
LABEL maintainer="rinhtt"
ADD ./target/spring-boot-hello-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/
EXPOSE 8081
CMD ["deploy.sh", "run"]