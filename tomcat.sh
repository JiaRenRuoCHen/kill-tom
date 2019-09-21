#! /bin/bash
yum -y install java-1.8.0-openjdk
tar -zxf lnmp_soft.tar.gz
tar -zxflnmp_soft/apache-tomcat-8.0.30.tar.gz
mv apache-tomcat-8.0.30  /usr/local/tomcat
yum -y install rng-tools
systemctl start rngd ; systemctl enable rngd
/usr/local/tomcat/bin/startup.sh
ss -nltup | grep java
