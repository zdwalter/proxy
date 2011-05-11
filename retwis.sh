#!/bin/bash
proxy=$1
curl -d 'username=proxy&password=waiter328' http://vpn.gfw4.info/login -v 2>login
cookie=`grep -i cookie login | sed -e 's/.*Set-Cookie: //' -e 's/;.*//'`
echo $cookie
curl -b "$cookie" "http://vpn.gfw4.info/post" -d "status=http_proxy OK: $proxy" -v 2>post
