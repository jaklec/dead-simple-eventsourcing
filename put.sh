#!/usr/bin/env sh

op="$1"
value="$2"

if [ $op = "add" ]
then
  echo "$op $value" >> log
elif [ $op = "sub" ]
then
  echo "$op $value" >> log
else 
  echo "Unsupported operation!"
  exit 1
fi
