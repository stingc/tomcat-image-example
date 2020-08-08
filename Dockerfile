FROM java
MAINTAINER stingc

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update

# RUN apt-get update

RUN apt-get install -y wget

RUN cd /

RUN wget http://apache.stu.edu.tw/tomcat/tomcat-7/v7.0.105/bin/apache-tomcat-7.0.105.tar.gz

RUN tar zxvf apache-tomcat-7.0.105.tar.gz

CMD ["/apache-tomcat-7.0.105/bin/catalina.sh", "run"]

EXPOSE 8080
