#!/bin/sh

#uci set wireless.@wifi-iface[4].macfilter=deny
uci del_list wireless.@wifi-iface[4].maclist=$1

sed -i "/$1/d" /tmp/run/hostapd-wlan0-2.maclist

#uci set wireless.@wifi-iface[5].macfilter=deny
uci del_list wireless.@wifi-iface[5].maclist=$1

sed -i "/$1/d" /tmp/run/hostapd-wlan1-3.maclist


uci commit wireless
#wifi reload

