#!/usr/bin/env sh

file="log"
number="0"

touch "$file"

while read -r line
do
  op=$(echo "$line" | cut -d ' ' -f1)
  x=$(echo "$line" | cut -d ' ' -f2)

  if [ $op = "add" ]
  then
    number=$(($number + $x))
  elif [ $op = "sub" ]
  then
    number=$(($number - $x))
  else
    echo 'Unsupported operation'
    exit 1
  fi
done < "$file" 

echo "$number"
