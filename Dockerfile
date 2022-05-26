#FROM tomcat:8-jdk8-openjdk-slim
#COPY target/maven-web-app*.war /usr/local/tomcat/webapps/maven-web-application.war


FROM centos:7

RUN yum install -y java-1.8.0-openjdk-devel
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.79/bin/apache-tomcat-8.5.79.tar.gz
RUN ls -lrth && \
    tar xvfz apache-tomcat-8.5.79.tar.gz
RUN mv apache-tomcat-8.5.79/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
COPY target/maven-web-app*.war /opt/tomcat/webapps/maven-web-application.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
