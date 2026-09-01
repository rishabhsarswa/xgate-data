#!/bin/bash

cd "$(dirname $0)"


#rsync -av --progress /home/rishu/data/smj_data smj_data

echo "Loading data into Git ... "


#git remote set-url origin https://rishabhsarswa:TOKEN@github.com/rishabhsarswa/xgate-data.git


git add .
git commit -m "mark update auto $@"
git push origin main
