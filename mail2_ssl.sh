#!/bin/bash

/sbin/service nginx stop
 sleep 2
#./certbot-auto --force-renewal >> /dev/null 2>&1
/home/./certbot-auto renew
sleep 5
/sbin/service nginx start