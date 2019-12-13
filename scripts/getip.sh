cat /proc/net/arp | grep $1 | grep -v 'IP' | awk '{print $1}'


