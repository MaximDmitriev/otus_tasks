yum install httpd -y
echo !!!COPY httpd config!!!
cp ./httpd/httpd.conf /etc/httpd/conf/
echo !!!COPY html content!!!
cp ./content/* /var/www/html/
echo !!!START httpd!!!
systemctl enable httpd --now
echo !!!CHECK STATUS!!!
systemctl status httpd
