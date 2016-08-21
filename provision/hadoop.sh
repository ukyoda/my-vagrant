#!/usr/bin/env bash

cat >> /etc/yum.repos.d/cloudera-cdh5.repo <<EOF

[cloudera-cdh5]
# Packages for Cloudera's Distribution for Hadoop, Version 5, on RedHat or CentOS 6 x86_64
name=Cloudera's Distribution for Hadoop, Version 5
baseurl=http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/5/
gpgkey = http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
gpgcheck = 1

EOF

useradd hdfs

yum install -y hadoop-conf-pseudo.x86_64

sudo -u hdfs hdfs namenode -format
service hadoop-hdfs-namenode start
service hadoop-hdfs-datanode start
service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

chkconfig hadoop-hdfs-namenode on
chkconfig hadoop-hdfs-datanode on
chkconfig hadoop-yarn-resourcemanager on
chkconfig hadoop-yarn-nodemanager on
chkconfig hadoop-mapreduce-historyserver on

# hdfs作成
sudo -u hdfs hadoop fs -mkdir /user
sudo -u hdfs hadoop fs -mkdir /user/hdfs
sudo -u hdfs hadoop fs -mkdir /user/vagrant
sudo -u hdfs hadoop fs -chown vagrant:vagrant /user/vagrant
