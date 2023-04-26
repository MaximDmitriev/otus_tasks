#!/bin/bash
yum install mysql mysql-server -y
cp mysql/slave/my.cnf /etc/
systemctl enable mysqld --now
grep 'temporary password' /var/log/mysqld.log
