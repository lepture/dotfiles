#!/bin/bash

wget "http://nginx.org/download/nginx-1.1.7.tar.gz" -O "nginx.tar.gz"
wget "http://www.grid.net.ru/nginx/download/nginx_upload_module-2.2.0.tar.gz" -O "nginx_upload.tar.gz"

rm -fr "/tmp/nginx"
mkdir "/tmp/nginx"

tar -C "/tmp/nginx" -xf "nginx.tar.gz"
tar -C "/tmp/nginx" -xf "nginx_upload.tar.gz"

# apt-get install libpcre3 libpcre3-dev
cd "/tmp/nginx/nginx-1.1.7"
./configure --with-http_ssl_module --add-module=/tmp/nginx/nginx_upload_module-2.2.0 --pid-path=/var/run/nginx.pid --lock-path=/var/lock/nginx.lock --prefix=/usr/local/etc/nginx --sbin-path=/usr/local/sbin/nginx --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --conf-path=/usr/local/etc/nginx/nginx.conf
make
make install
