#!/bin/sh

EBT=/usr/sbin/ebtables

# die if ebtables not found
[[ -x "$EBT" ]] || { echo "$0: error \"$EBT\" not found."; exit 1; }

# die if we are not root
[[ "$(id -u)" != "0" ]] && { echo "Error: $0 script must be run as root." 2>&1; exit 2; }

# Let us start
for p in INPUT FORWARD OUTPUT
do
  echo "Accepting $p"
  $EBT -P $p ACCEPT
done
for T in filter nat broute
do
        echo "Flushing and deleting $T..."
        $EBT -t $T -F
        $EBT -t $T -X
done