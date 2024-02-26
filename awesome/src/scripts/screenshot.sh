maim -s -u -f png '()'
date=$(date --rfc-3339=date)
dims=$(file '()' | sed 's/^[^,]*, \([^,]*\).*/\1/' | sed 's/ //g')
mkdir -p "$HOME/Pictures/screenshots/"
mv '()' "$HOME/Pictures/screenshots/""$date"_"$dims.png"
