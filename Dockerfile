#FROM tomcat:8-jdk8-openjdk-slim
#COPY target/maven-web-app*.war /usr/local/tomcat/webapps/maven-web-application.war


FROM centos:7
ARG JAVA_VER
ARG TOMCAT_MAJOR_VER
ARG TOMCAT_VER

RUN yum install -y java-${JAVA_VER}-openjdk-devel
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-${TOMCAT_MAJOR_VER}/v${TOMCAT_VER}/bin/apache-tomcat-${TOMCAT_VER}.tar.gz
RUN ls -lrth && \
    tar xvfz apache-tomcat-${TOMCAT_VER}.tar.gz
RUN mv apache-tomcat-${TOMCAT_VER}/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
COPY target/maven-web-app*.war /opt/tomcat/webapps/maven-web-application.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
