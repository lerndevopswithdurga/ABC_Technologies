FROM docker.io/library/ubuntu:20.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-17-jdk wget
RUN mkdir /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.tar.gz  /tmp/apache-tomcat-9.0.86.tar.gz
RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.86.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.86/* /usr/local/tomcat/
ADD target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
