#!/bin/sh

yum update -y
yum groupinstall -y "Development Tools"
yum install -y gcc gcc-c++ make git openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel
yum install -y wget 
yum install -y epel-release