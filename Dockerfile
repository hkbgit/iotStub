from tomcat:8.5.46-jdk8-openjdk 
MAINTAINER ies
RUN rm -rf /usr/local/tomcat/webapps/*

COPY iot-stub-aa /usr/local/tomcat/webapps/
COPY iot-stub-ab /usr/local/tomcat/webapps/

RUN cat /usr/local/tomcat/webapps/iot-stub-* > /usr/local/tomcat/webapps/iot-stub.war
RUN unzip /usr/local/tomcat/webapps/iot-stub.war -d /usr/local/tomcat/webapps/ROOT

RUN mkdir /home/vcap
RUN chmod 777 /home/vcap
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
