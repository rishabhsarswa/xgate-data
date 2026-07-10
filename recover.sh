#!/bin/bash

filename="list.txt"

while IFS= read -r line
do
  echo "$line"
  

# Split into two variables
hash=$(echo "$line" | awk '{print $1}')
filename=$(echo "$line" | awk '{print $2}')

echo "Hash: $hash"
echo "Filename: $filename"



done < "$filename"

