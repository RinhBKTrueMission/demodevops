#FROM tomcat:latest
#LABEL maintainer="rinhtt"
#ADD ./target/spring-boot-hello-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/
#EXPOSE 8081
#CMD ["deploy.sh", "run"]

FROM jenkins:1.596

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt