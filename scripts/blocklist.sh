#!/bin/sh

uci set wireless.@wifi-iface[0].macfilter=deny
uci add_list wireless.@wifi-iface[0].maclist=$1

uci commit wireless
wifi reload

