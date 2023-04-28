#!/bin/bash
echo !!!ADD REPO!!!
cp ./repo/*.repo /etc/yum.repos.d/
yum localinstall -y mysql80-community-release-el7-7.noarch.rpm
yum install nano
yum install net-tools
