curr_cpu=$(awk 'NR==1 {printf "%d %d\n", $5, ($2+$3+$4+$5+$6+$7+$8)}' /proc/stat)

# make it if it doesn't exist
if [[ ! -f $last_cpu ]]; then
  touch "$HOME/.cache/lastcpu"
fi

last_cpu="$HOME/.cache/lastcpu"

# fill it if it's empty
if [[ $(wc -c "$last_cpu" | awk '{print $1}') -eq 0 ]]; then
  echo '0 0\n' > $last_cpu
fi

# put in current times
echo $curr_cpu >> $last_cpu

cat $last_cpu | tr '\n' ' ' | awk '{printf " %05.2f%%\n", 100-(100*($3-$1))/($4-$2)}'

sed -i '1d' $last_cpu
