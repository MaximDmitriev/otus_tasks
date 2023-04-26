#!/bin/bash
yum install logstash -y
cp logstash/nginx.conf /etc/logstash/conf.d/
cp /etc/elasticsearch/certs/http_ca.crt /etc/logstash
chown logstash:logstash /etc/logstash/http_ca.crt
systemctl enable logstash --now
