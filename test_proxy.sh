#!/bin/bash
num=1 # don't change
list=$1

export LD_LIBRARY_PATH=./lib
cat $list | while read proxy; do ./visit_with_proxy.sh $proxy ;done
