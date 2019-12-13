ebtables -D FORWARD -d $1 -j DROP        
ebtables -D FORWARD -d $2 -j DROP

ebtables -A FORWARD -s $1 -d $2 -j ACCEPT
ebtables -A FORWARD -s $2 -d $1 -j ACCEPT

ebtables -A FORWARD -d $1 -j DROP
ebtables -A FORWARD -d $2 -j DROP
