#!/bin/sh

if [ $1 ==  "`uci get wireless.@wifi-iface[$2].maclist|grep -o $1|head -1`" ]

then
	echo "1"
else

#uci set wireless.@wifi-iface[0].macfilter=allow
#uci add_list wireless.@wifi-iface[0].maclist=$1

#uci set wireless.@wifi-iface[3].macfilter=allow
#uci add_list wireless.@wifi-iface[3].maclist=$1

#uci set wireless.@wifi-iface[4].macfilter=deny
#uci add_list wireless.@wifi-iface[4].maclist=$1

#uci set wireless.@wifi-iface[5].macfilter=deny
#uci add_list wireless.@wifi-iface[5].maclist=$1

#uci commit wireless
#wifi reload

#/etc/init.d/network reload

        echo "0"
fi

