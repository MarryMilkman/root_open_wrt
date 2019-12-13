#!/bin/sh

uci set wireless.@wifi-iface[6].macfilter=allow
uci del_list wireless.@wifi-iface[6].maclist=$1

sed -i "/$1/d" /tmp/run/hostapd-wlan0-3.maclist

uci set wireless.@wifi-iface[7].macfilter=allow
uci del_list wireless.@wifi-iface[7].maclist=$1

sed -i "/$1/d" /tmp/run/hostapd-wlan1-4.maclist

#uci set wireless.@wifi-iface[4].macfilter=deny
#uci del_list wireless.@wifi-iface[4].maclist=$1

#uci set wireless.@wifi-iface[5].macfilter=deny
#uci del_list wireless.@wifi-iface[5].maclist=$1

uci commit wireless
#wifi reload
#/etc/init.d/network reload

