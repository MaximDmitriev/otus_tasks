#!/bin/bash
yum install prometheus -y
cp prometheus/prometheus.yml /etc/prometheus/
systemctl enable prometheus.service --now
firewall-cmd --zone=public --add-port=9090/tcp --permanent
firewall-cmd --reload
