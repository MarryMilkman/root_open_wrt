#!/bin/sh


ebtables -P FORWARD DROP
ebtables -A FORWARD -p IPv4 -j ACCEPT
ebtables -A FORWARD -p ARP -j ACCEPT
ebtables -A FORWARD -p LENGTH -j ACCEPT
ebtables -A FORWARD --log-level info --log-ip --log-prefix EBFW
ebtables -P INPUT DROP
ebtables -A INPUT -p IPv4 -j ACCEPT
ebtables -A INPUT -p ARP -j ACCEPT
ebtables -A INPUT -p LENGTH -j ACCEPT
ebtables -A INPUT --log-level info --log-ip --log-prefix EBFW
ebtables -P OUTPUT DROP
ebtables -A OUTPUT -p IPv4 -j ACCEPT
ebtables -A OUTPUT -p ARP -j ACCEPT
ebtables -A OUTPUT -p LENGTH -j ACCEPT
ebtables -A OUTPUT --log-level info --log-ip --log-arp --log-prefix EBFW -j DROP


ebtables -A FORWARD -p IPv4 --among-dst 4C:D1:A1:36:19:3C=192.168.1.215,E4:95:6E:6B:44:55=192.168.1.1 -j MATCHING-MAC-IP-PAIR

ebtables -A INPUT -p IPv4 --among-dst 4C:D1:A1:36:19:3C=192.168.1.215,E4:95:6E:6B:44:55=192.168.1.1 -j MATCHING-MAC-IP-PAIR

ebtables -A FORWARD -p IPv4 -s ! 4C:D1:A1:36:19:3C --ip-src 192.168.1.215 -j DROP

ebtables -A INPUT -p IPv4 -s ! 4C:D1:A1:36:19:3C --ip-src 192.168.1.215 -j DROP

