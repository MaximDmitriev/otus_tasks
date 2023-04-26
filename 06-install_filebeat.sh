#!/bin/bash
yum install filebeat -y
cp filebeat/filebeat.yml /etc/filebeat/
systemctl enable filebeat --now
filebeat modules enable nginx
cp filebeat/nginx.yml /etc/filebeat/modules.d/
systemctl restart filebeat
