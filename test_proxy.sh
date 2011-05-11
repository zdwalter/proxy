#!/bin/bash
num=1 # don't change
list=$1

killall -9 Xvfb;
killall -9 xvfb-run;
export LD_LIBRARY_PATH=./lib
cat $list | xargs -L1 -P $num  ./visit_with_proxy.sh 
