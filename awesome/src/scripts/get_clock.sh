now=$(date '+%I:%M%P 󰃭 %a: %b %d')
hour=$(echo "$now" | sed -n 's/^\([^:]*\).*/\1/p')

if   [[ "$hour" -eq 01 ]]; then
  icon='󱐿'
elif [[ "$hour" -eq 02 ]]; then
  icon='󱑀'
elif [[ "$hour" -eq 03 ]]; then
  icon='󱑁'
elif [[ "$hour" -eq 04 ]]; then
  icon='󱑂'
elif [[ "$hour" -eq 05 ]]; then
  icon='󱑃'
elif [[ "$hour" -eq 06 ]]; then
  icon='󱑄'
elif [[ "$hour" -eq 07 ]]; then
  icon='󱑅'
elif [[ "$hour" -eq 08 ]]; then
  icon='󱑆'
elif [[ "$hour" -eq 09 ]]; then
  icon='󱑇'
elif [[ "$hour" -eq 10 ]]; then
  icon='󱑈'
elif [[ "$hour" -eq 11 ]]; then
  icon='󱑉'
elif [[ "$hour" -eq 12 ]]; then
  icon='󱑊'
fi

echo "$icon $now"
