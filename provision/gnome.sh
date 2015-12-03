#!/bin/sh

sudo yum -y groups install xfce
sudo LANG=C yum groups install -y "GNOME Desktop"
sudo systemctl set-default graphical.target
systemctl get-default

sudo yum install -y tigervnc-server

startx &