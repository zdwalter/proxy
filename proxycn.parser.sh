#!/bin/bash
url=$1
wget "$url" -O html
cat html | grep -i clip | grep -i alert| cut -d\' -f 2 >> http.list
