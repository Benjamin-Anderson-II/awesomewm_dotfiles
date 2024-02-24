echo " $(df -h | rg -U '/\n' | sed -n 's/.* .* \([0-9].*[A-Z]\).*/\1/p' | sed 's/.$//') GiB"
