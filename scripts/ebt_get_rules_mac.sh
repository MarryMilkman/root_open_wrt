ebtables  -L --Lx | grep $1 | awk '{$1 = ""; $2 = ""; $3 = ""; $4 = ""; print}' | sed 's/^[ \t]*//'
