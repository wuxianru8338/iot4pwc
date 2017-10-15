#!/bin/bash

sudo apt-get update
sudo apt-get install -y default-jre default-jdk maven
sudo chmod 777 /etc/environment
HOST=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
sudo echo "HOST=\"$HOST\"" >> /etc/environment
sudo echo "JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java\"" >> /etc/environment
source /etc/environment
wget https://bintray.com/artifact/download/vertx/downloads/vert.x-3.4.2-full.tar.gz
tar -zxf vert.x-3.4.2-full.tar.gz
rm *.gz
export PATH=~/vertx/bin:$PATH
export HOST
sudo ufw allow 37288