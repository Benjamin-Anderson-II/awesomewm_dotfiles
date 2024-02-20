#!/bin/bash
curr_brightness=$(head "/sys/class/backlight/intel_backlight/brightness")
percent=$(($curr_brightness*100/120000))

if [[ $percent -lt 33 ]]; then
  echo "󰃜 $percent%"
elif [[ $percent -lt 66 ]]; then
  echo "󰃛 $percent%"
else
  echo "󰃚 $percent%"
fi 
