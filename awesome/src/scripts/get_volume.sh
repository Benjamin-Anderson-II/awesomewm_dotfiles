#!/bin/bash

sink=$(pactl get-default-sink)
vol=$(pactl get-sink-volume $sink | sed -n 's/.* \(.*%\).*/\1/p'|sed -n 's/%//p')
mute=$(pactl get-sink-mute $sink | sed 's/Mute: //')

if [[ $mute == "yes" ]]; then
  echo "󰝟 $vol%"
elif [[ vol -eq 0 ]]; then
  echo "󰝟 $vol%"
elif [[ vol -lt 33 ]]; then
  echo "󰕿 $vol%"
elif [[ vol -lt 66 ]]; then
  echo "󰖀 $vol%"
else
  echo "󰕾 $vol%"
fi
