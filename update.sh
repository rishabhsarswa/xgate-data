#!/bin/bash

cd "$(dirname $0)"


#rsync -av --progress /home/rishu/data/smj_data smj_data

echo "Loading data into Git ... "



git add .
git commit -m "mark update auto $@"
git push origin main
