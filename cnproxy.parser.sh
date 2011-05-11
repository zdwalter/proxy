#!/bin/bash
url=$1
#wget "$url" -O html
curl "$url" -o html
cat html | grep -i "document.write(\":\"" | sed -e "s/^<tr><td>//" -e "s/<SCRIPT.*(\":\"/:/" -e "s/+z/3/g" -e "s/+m/4/g" -e "s/+k/2/g" -e "s/+l/9/g" -e "s/+d/0/g" -e "s/+b/5/g" -e "s/+i/7/g" -e "s/+w/6/g" -e "s/+r/8/g" -e "s/+c/1/g" | while read line; do proxy=`echo "$line" | cut -c1-30 2>/dev/null| sed -e "s/).*//"`; echo $proxy >> http.list; done
