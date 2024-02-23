level=$(acpi -b | sed -n 's/.* \(.*\)%.*/\1/p')
charging=$(acpi -b | sed -n 's/.*: \([^,]*\),.*/\1/p')

if [[ "$charging" == Charging ]]; then
  if   [[ "$level" -eq 100 ]]; then
    echo "󰂅 $level%"
  elif [[ "$level" -gt 90 ]]; then
    echo "󰂋 $level%"
  elif [[ "$level" -gt 80 ]]; then
    echo "󰂊 $level%"
  elif [[ "$level" -gt 70 ]]; then
    echo "󰢞 $level%"
  elif [[ "$level" -gt 60 ]]; then
    echo "󰂉 $level%"
  elif [[ "$level" -gt 50 ]]; then
    echo "󰢝 $level%"
  elif [[ "$level" -gt 40 ]]; then
    echo "󰂈 $level%"
  elif [[ "$level" -gt 30 ]]; then
    echo "󰂇 $level%"
  elif [[ "$level" -gt 20 ]]; then
    echo "󰂆 $level%"
  elif [[ "$level" -gt 10 ]]; then
    echo "󰢜 $level%"
  else
    echo "󰢟 $level%"
  fi
else 
  if   [[ "$level" -eq 100 ]]; then
    echo "󰁹 $level%"
  elif [[ "$level" -gt 90 ]]; then
    echo "󰂂 $level%"
  elif [[ "$level" -gt 80 ]]; then
    echo "󰂁 $level%"
  elif [[ "$level" -gt 70 ]]; then
    echo "󰂀 $level%"
  elif [[ "$level" -gt 60 ]]; then
    echo "󰁿 $level%"
  elif [[ "$level" -gt 50 ]]; then
    echo "󰁾 $level%"
  elif [[ "$level" -gt 40 ]]; then
    echo "󰁽 $level%"
  elif [[ "$level" -gt 30 ]]; then
    echo "󰁼 $level%"
  elif [[ "$level" -gt 20 ]]; then
    echo "󰁻 $level%"
  elif [[ "$level" -gt 10 ]]; then
    echo "󰁺 $level%"
  else
    echo "󰂎 $level%"
  fi
fi
