#!/bin/bash
screen=`seq 10 | shuf | head -n1`
proxy=$1
url="http://zdwalter.blogspot.com"

echo -n $proxy

killall -9 Xvfb;
killall -9 xvfb-run;
echo > /tmp/$screen.png
xvfb-run -a -f /tmp/$screen.xauthority --server-args="-screen $screen, 800x600x16" ./CutyCapt --url=$url --out=/tmp/$screen.png --http-proxy="http://$proxy" 
pid=$!

seq 60 | while read i; do
sleep 1;
[ ! -e "/proc/$pid/" ] && echo "$proxy $i `ls -l /tmp/$screen.png | awk '{print $5}'`" > test.log && exit 0;
done

kill -9 $pid
cat test.log | while read h x size; do [ $size -gt 10000 ] && ./retwis.sh $h; done
