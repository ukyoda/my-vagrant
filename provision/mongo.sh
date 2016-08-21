#!/usr/bin/env bash

cat >> /etc/yum.repos.d/mongodb.repo <<EOF
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF

yum install -y mongodb-org
systemctl start mongod
systemctl enable mongod
