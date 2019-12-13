#!/bin/sh

exit 0

it  [ -z "$SSID" ]
then
      echo "SSID=`uci get wireless.@wifi-iface[0].ssid`"
#      echo "SSID=`uci get wireless.@wifi-iface[3].ssid`"
else
      uci set wireless.@wifi-iface[0].ssid="$SSID"
      uci set wireless.@wifi-iface[3].ssid="$SSID"
      uci set wireless.@wifi-iface[4].ssid="$SSID"
      uci set wireless.@wifi-iface[5].ssid="$SSID"
      uci set wireless.@wifi-iface[6].ssid="$SSID"
      uci set wireless.@wifi-iface[7].ssid="$SSID"
fi

if [ -z "$PASS" ]
then
        echo "Encryption and/or password is empty"
else
	
#        uci set wireless.@wifi-iface[0].encryption=psk2 # Set encryption (psk2 by default)
        uci set wireless.@wifi-iface[0].key="$PASS" 
	uci set wireless.@wifi-iface[3].key="$PASS" 
	uci set wireless.@wifi-iface[4].key="$PASS" 
	uci set wireless.@wifi-iface[5].key="$PASS" 
	uci set wireless.@wifi-iface[6].key="$PASS" 
	uci set wireless.@wifi-iface[7].key="$PASS"
fi


uci commit wireless

wifi reload

exit 0

