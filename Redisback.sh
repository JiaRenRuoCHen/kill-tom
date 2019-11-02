#! /bin/bash
rm -rf /var/lib/redis/6379/*
sed -i 815s/c/'#c'/ /etc/redis/6379.conf
sed -i 823s/cl/'#cl'/ /etc/redis/6379.conf
sed -i 829s/cl/'#cl'/ /etc/redis/6379.conf
redis-cli -h 192.168.4.50 -p 6350 shutdown
/etc/init.d/redis_6379 start 
netstat -nltup | grep redis

