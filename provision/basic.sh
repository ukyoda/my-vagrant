#!/usr/bin/env bash

yum update -y
yum groupinstall -y "Development Tools"
yum install -y gcc gcc-c++ make git openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel
yum install -y wget
yum install -y epel-release

# タイムゾーン設定、LANG設定
yum -y install ibus-kkc vlgothic-*
localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf
timedatectl set-timezone Asia/Tokyo