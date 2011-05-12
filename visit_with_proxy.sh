#!/bin/bash
screen=`seq 10 | shuf | head -n1`
proxy=$1
url="http://zdwalter.blogspot.com"

echo -n $proxy
export http_proxy=$proxy
curl $url -o /tmp/$screen.html

size=`ls -l /tmp/$screen.html | awk '{print $5}'`
[ $size -gt 10000 ] && ./retwis.sh $proxy
