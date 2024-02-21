percent_f=$(free -b|awk 'NR==2 {printf "%.2f", 100*($3/$2)}')
percent_d=$(percent_f|awk '{printf "%d", $1}')
gb=$(free|awk 'NR==2 {printf "%.2fG\n", ($3/1048576)}')
if [[ $percent_d -lt 34 ]]; then
  icon="󰾆 "
elif [[ $percent_d -lt 67 ]]; then
  icon="󰾅 "
else
  icon="󰓅 "
fi
if [[ $1 == p ]]; then
  echo $icon $percent_f "%"
elif [[ $1 == g ]]; then
  echo $icon $gb
fi
