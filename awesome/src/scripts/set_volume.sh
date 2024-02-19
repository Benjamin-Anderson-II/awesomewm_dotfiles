#!/bin/bash

sink=$(pactl get-default-sink)
if [ $1 == '+' ]; then
  pactl set-sink-volume $sink +5%
elif [ $1 == '-' ]; then
  pactl set-sink-volume $sink -5%
elif [ $1 == '0' ]; then
  pactl set-sink-mute $sink toggle
fi
