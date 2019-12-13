#!/bin/sh

 /etc/init.d/firewall stop


iptables -t nat -A POSTROUTING -o eth1 -m set --match-set defguest src -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth1 -m set --match-set deflan src -j MASQUERADE

iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT

#sleep 2m

#/etc/init.d/firewall start
