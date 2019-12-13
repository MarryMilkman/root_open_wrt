#!/bin/sh

for MAC in `cat mac_accept`; 

	do iptables -A FORWARD -i br-lan -o wlan1 -m mac --mac-source $MAC -j ACCEPT 

done

iptables -P FORWARD DROP

