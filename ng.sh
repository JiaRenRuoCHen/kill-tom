#! /bin/bash
yum -y install gcc pcre-devel openssl-devel > /dev/null
useradd -s /sbin/nologin nginx
tar -zxf lnmp_soft.tar.gz
tar -zxf lnmp_soft/nginx-1.12.2.tar.gz 
cd nginx-1.12.2/
./configure --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install
cd
/usr/local/nginx/sbin/nginx

