#!/bin/bash

if [ $1 == '0' ]; then
  pactl set-sink-mute "$(pactl get-default-sink)" toggle
else
  pactl set-sink-volume "$(pactl get-default-sink)" "$1"5%
fi
