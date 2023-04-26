#!/bin/bash
echo !!!install nginx!!!
yum install nginx -y
echo !!!install nginx_exporter!!!
yum install nginx_exporter -y
echo !!!copy nginx cfg!!!
cp ./nginx/nginx.conf /etc/nginx/
echo !!!copy nginx exporter cfg!!!
cp ./nginx/nginx_exporter /etc/default/
echo !!!start nginx!!!
systemctl enable nginx --now
echo !!!start nginx exporter!!!
systemctl enable nginx_exporter --now
echo !!!configure firewall!!!
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-port=9113/tcp --permanent
firewall-cmd --reload
systemctl status nginx
systemctl status nginx_exporter
