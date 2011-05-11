#!/bin/bash
screen=`seq 10 | shuf | head -n1`
proxy=$1
url="http://zdwalter.blogspot.com"

echo > /tmp/$screen.png
echo xvfb-run -f /tmp/$screen.xauthority --server-args="-screen $screen, 640x480x8" ./CutyCapt --url=$url --out=/tmp/$screen.png --http-proxy="http://$proxy" --delay=${screen}000
xvfb-run -a -f /tmp/$screen.xauthority --server-args="-screen $screen, 800x600x16" ./CutyCapt --url=$url --out=/tmp/$screen.png --http-proxy="http://$proxy" &
pid=$!

seq 60 | while read i; do
sleep 1;
[ ! -e "/proc/$pid/" ] && echo "$proxy $i `ls -l /tmp/$screen.png | awk '{print $5}'`" >> money.log && exit 0;
done

kill -9 $pid
echo kill $pid

