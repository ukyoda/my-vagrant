#!/usr/bin/env bash

#yum install -y java
yum install -y java-1.7.0 java-1.7.0-devel

mkdir /usr/local/maven
cd /usr/local/maven

wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
tar xvzf apache-maven-3.3.1-bin.tar.gz

mv apache-maven-3.3.1 /opt/maven
cd /opt/maven

sudo cat > /etc/profile.d/maven.sh <<-MAVEN
#export MAVEN_OPTS="-Xms256m -Xmx512m"
export M3_HOME=/opt/maven
export PATH=$PATH:\${M3_HOME}/bin

MAVEN

source /etc/profile.d/maven.sh
