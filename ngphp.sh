#!/bin/bash
yum -y install gcc pcre-devel openssl-devel
tar -zxf lnmp_soft.tar.gz
tar -zxf lnmp_soft/nginx-1.12.2.tar.gz
cd nginx-1.12.2/
useradd -s /sbin/nologin nginx
./configure --user=nginx --group=nginx --with-http_ssl_module
make && make install
sed -i '65,71s/#//' /usr/local/nginx/conf/nginx.conf
sed -i '/SCRIPT_FILENAME/d' /usr/local/nginx/conf/nginx.conf
sed -i 's/fastcgi_params/fastcgi.conf/' /usr/local/nginx/conf/nginx.conf
sed -i '45s/index.htm;/index.php;/' /usr/local/nginx/conf/nginx.conf
yum -y install mariadb mariadb-server mariadb-devel
yum -y install php php-fpm php-devel
systemctl restart mariadb php-fpm
systemctl enable mariadb php-fpm
/usr/local/nginx/sbin/nginx
cd lnmp_soft/php_scripts/
tar -zxf php-memcached-demo.tar.gz
cd php-memcached-demo
cp -a * /usr/local/nginx/html/

