## Инструкция + набор скриптов для аварийного восстановления хостов

Дано 2 хоста. На одном (мастер) должен быть балансировщик (nginx + apache), mysql, ELK, Prometheus + Grafana. На втором (слейв) mysql реплика 

master: root@212.237.219.8 <br />
slave: root@212.237.219.40 <br />

****
***Шаги для восстановления:***
- переходим на 212.237.219.8 (мастер)
- клонировать репозиторий https://github.com/MaximDmitriev/otus_tasks.git
- запускаем скрипт *01-add_repo.sh*
- запускаем скрипт *02-install_httpd.sh*
- запускаем скрипт *03-install_nginx.sh*
- запускаем скрипт *04-install_mysql_master.sh*
- выполняем инструкции из *mysql_first_configuration_master.txt* 
- переходим на 212.237.219.40 (слейв)
- клонировать репозиторий https://github.com/MaximDmitriev/otus_tasks.git
- запускаем скрипт *01-add_repo.sh*
- запускаем скрипт *04-install_mysql_slave.sh*
- выполняем инструкции из *mysql_first_configuration_slave.txt* 
- переходим на 212.237.219.8 (мастер)
- запускаем скрипт *05-install_elk.sh* (обязательно сохранить пароль от эластика!!!)
- меняем IP в конфиге кибана на 212.237.219.8 (/etc/kibana/kibana.yml)
- запускаем скрипт *06-install_filebeat.sh*
- запускаем скрипт *07-install_logstash.sh*
- меняем пароль в конфиге логстеш (/etc/logstash/conf.d/nginx.conf  подставляем сохраненны от эластика)
- запускаем скрипт *08-install_prometheus.sh*
- запускаем скрипт *09-install_grafana.sh*