#!bin/bash
curr_brightness=$(head "/sys/class/backlight/intel_backlight/brightness")
if [ $curr_brightness -le 119999 ]; then
  echo $((curr_brightness+2000)) > /sys/class/backlight/intel_backlight/brightness
fi
