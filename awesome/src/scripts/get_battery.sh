level=$(cat /sys/class/power_supply/BAT1/capacity)
charging=$(cat /sys/class/power_supply/BAT1/status)

if [[ "$charging" == Charging ]]; then
  if   [[ "$level" -eq 100 ]]; then
    icon="󰂅 "
  elif [[ "$level" -gt 90 ]]; then
    icon="󰂋 "
  elif [[ "$level" -gt 80 ]]; then
    icon="󰂊 "
  elif [[ "$level" -gt 70 ]]; then
    icon="󰢞 "
  elif [[ "$level" -gt 60 ]]; then
    icon="󰂉 "
  elif [[ "$level" -gt 50 ]]; then
    icon="󰢝 "
  elif [[ "$level" -gt 40 ]]; then
    icon="󰂈 "
  elif [[ "$level" -gt 30 ]]; then
    icon="󰂇 "
  elif [[ "$level" -gt 20 ]]; then
    icon="󰂆 "
  elif [[ "$level" -gt 10 ]]; then
    icon="󰢜 "
  else
    icon="󰢟 "
  fi
else 
  if   [[ "$level" -eq 100 ]]; then
    icon="󰁹 "
  elif [[ "$level" -gt 90 ]]; then
    icon="󰂂 "
  elif [[ "$level" -gt 80 ]]; then
    icon="󰂁 "
  elif [[ "$level" -gt 70 ]]; then
    icon="󰂀 "
  elif [[ "$level" -gt 60 ]]; then
    icon="󰁿 "
  elif [[ "$level" -gt 50 ]]; then
    icon="󰁾 "
  elif [[ "$level" -gt 40 ]]; then
    icon="󰁽 "
  elif [[ "$level" -gt 30 ]]; then
    icon="󰁼 "
  elif [[ "$level" -gt 20 ]]; then
    icon="󰁻 "
  elif [[ "$level" -gt 10 ]]; then
    icon="󰁺 "
  else
    icon="󰂎 "
  fi
fi

echo "$icon$level%"
