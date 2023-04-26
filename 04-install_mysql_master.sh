#!/bin/bash
yum install mysql mysql-server -y
cp mysql/master/my.cnf /etc/
systemctl enable mysqld --now
grep 'temporary password' /var/log/mysqld.log
firewall-cmd --zone=public --permanent --add-port=3306/tcp
firewall-cmd --reload


