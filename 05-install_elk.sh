#!/bin/bash
yum install --enablerepo=elasticsearch elasticsearch -y
systemctl daemon-reload
systemctl enable elasticsearch.service --now
curl --cacert /etc/elasticsearch/certs/http_ca.crt -u elastic https://localhost:9200
yum install kibana -y
systemctl daemon-reload
systemctl enable kibana.service --now
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
firewall-cmd --zone=public --add-port=5601/tcp --permanent
firewall-cmd --reload
