#!/bin/bash
connectivity=$(nmcli -t -f CONNECTIVITY g)

if   [ $connectivity == "full" ]; then
  connectivity='󰤨'
elif [ $connectivity == "none" ]; then
  connectivity='󰤭'
elif [ $connectivity == "limited" ]; then
  connectivity='󰤩'
elif [ $connectivity == "portal" ]; then
  connectivity='󰤪'
else
  connectivity=' '
fi

nmcli -t -f NAME c s -a | sed -n '1p' | sed -n "s/\(.*\)/$connectivity \1/p"
