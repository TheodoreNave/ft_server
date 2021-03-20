#!/bin/bash

service nginx start
service mysql start
service php7.3-fpm start 
bash /tmp/on_off.sh

while true;
    do sleep 10000;
done