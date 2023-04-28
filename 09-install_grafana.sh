#!/bin/bash
yum install grafana -y
systemctl daemon-reload
systemctl enable grafana-server –now
firewall-cmd --zone=public --add-port=3000/tcp --permanent
firewall-cmd --reload
