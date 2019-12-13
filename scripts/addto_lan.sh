#!/bin/sh

uci set wireless.@wifi-iface[0].macfilter=allow
uci add_list wireless.@wifi-iface[0].maclist=$1

echo "$1" >> /tmp/run/hostapd-wlan0.maclist

uci set wireless.@wifi-iface[3].macfilter=allow
uci add_list wireless.@wifi-iface[3].maclist=$1

echo "$1" >> /tmp/run/hostapd-wlan1-2.maclist

#uci set wireless.@wifi-iface[4].macfilter=deny
#uci add_list wireless.@wifi-iface[4].maclist=$1

#uci set wireless.@wifi-iface[5].macfilter=deny
#uci add_list wireless.@wifi-iface[5].maclist=$1

uci commit wireless
#wifi reload
#/etc/init.d/network reload

