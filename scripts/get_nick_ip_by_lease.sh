#!/bin/sh

ARP=`cat /proc/net/arp`

#cat /proc/net/arp | grep -v 'IP' | awk '{print $1}' |  cat /tmp/dhcp.leases | grep $1|awk '{print $4}'
cat /tmp/dhcp.leases | grep $1|awk '{print $4}'
cat /tmp/dhcp.leases | grep $1|awk '{print $3}'
