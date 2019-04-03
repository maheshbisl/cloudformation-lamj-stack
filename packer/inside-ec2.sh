#!/bin/sh

amazon-linux-extras install tomcat8.5 -y
systemctl enable tomcat
cp /tmp/packer/mahesh-webserver.war /usr/share/tomcat/webapps/