#!/bin/bash
curr_brightness=$(head "/sys/class/backlight/intel_backlight/brightness")
if [ $curr_brightness -ge 2001 ]; then
  echo $((curr_brightness-2000)) > /sys/class/backlight/intel_backlight/brightness
fi
