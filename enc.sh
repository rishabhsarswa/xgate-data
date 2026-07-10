#!/bin/bash


rm list.txt

tar -cf "xgate-src.tar.xz" /home/rishu/awn/projects/xgate/xgate_src

echo "source back done"

./enc-raw.sh "/home/rishu/web/njb"
./enc-raw.sh "/home/rishu/web/norm"
./enc-raw.sh "/home/rishu/xgate-data"

find "." -type f -print0 | xargs -0 du -h | sort -h



