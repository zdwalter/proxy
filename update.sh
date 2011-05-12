#!/bin/bash
rm http.list
cat cnproxy.url | xargs -n1 ./cnproxy.parser.sh
cat proxycn.url | xargs -n1 ./proxycn.parser.sh
sort http.list | uniq > x
mv x http.list
./test_proxy.sh
