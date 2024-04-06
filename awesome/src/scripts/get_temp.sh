#!/bin/bash

if [[ $1 == c ]]; then
  temp=$(sensors | sed -n 's/^Package[^+]*+\([^ ]*\) .*/\1/p'|sed 's/\..//')
  temp_d=$(echo $temp | sed 's/..$//')
  low=30
  mid=55
  high=80
  crit=100
elif [[ $1 == f ]]; then
  temp=$(sensors -f | sed -n 's/^Package[^+]*+\([^ ]*\) .*/\1/p'|sed 's/\..//')
  temp_d=$(echo $temp | sed 's/..$//')
  low=86
  mid=131
  high=176
  crit=212
fi

if [[ $temp_d -lt $low ]]; then
  echo " $temp"
elif [[ $temp_d -lt $mid ]]; then
  echo " $temp"
elif [[ $temp_d -lt $high ]]; then
  echo " $temp"
elif [[ $temp_d -lt $crit ]]; then
  echo " $temp"
else
  echo " $temp"
fi
