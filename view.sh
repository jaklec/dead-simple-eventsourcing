#!/usr/bin/env sh

htmlfile="view.html"

touch $htmlfile

while IFS= read -r event
do

  if [ -s "$htmlfile" ]
  then
    number=`xmllint --html --xpath //div/h1 "$htmlfile" | 
    cut -d ':' -f2 | 
    cut -d '<' -f1 | 
    xargs`
  fi

  number=${number:-0}

  op=`echo "$event" | cut -d ' ' -f1`
  x=`echo "$event" | cut -d ' ' -f2`

  if [ "$op" = "add" ]
  then
    number=$(($number + $x))
  elif [ "$op" = "sub" ]
  then
    number=$(($number - $x))
  else
    echo "$op is an unsupported operation"
    exit 1
  fi

  
  html="<html><body><div><h1>Value: $number</h1></body></html>"
  echo "$html" > view.html
done 

