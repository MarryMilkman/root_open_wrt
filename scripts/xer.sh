#!/bin/sh

#Usage ./xer.sh Client_MAC Network_Type Action (./xer.sh C0:38:96:98:6C:3B L (or G,S,O,C for other networks) A (or D to delete ))

#External for CLI
MAC="$1"     #Client MAC
FLAG="$2"    #Network L, G, S, O, C (Local, Guest, Smart, Sump, Custom)
ACT="-$3"    #"A" to Add rule or "D" to Delete rule

#Internal
RLANMAC="`uci show wireless.default_radio0.macaddr|awk -F="'" '{print $2}'|awk -F"'" '{print $1}'`"
RGUESTMAC="`uci show wireless.wifinet3.macaddr|awk -F="'" '{print $2}'|awk -F"'" '{print $1}'`"
RSMARTMAC="`uci show wireless.wifinet4.macaddr|awk -F="'" '{print $2}'|awk -F"'" '{print $1}'`"
RSUMPMAC="`uci show wireless.wifinet5.macaddr|awk -F="'" '{print $2}'|awk -F"'" '{print $1}'`"

WL_L="wireless.@wifi-iface[0]"
WL_G="wireless.@wifi-iface[3]"
WL_S="wireless.@wifi-iface[4]"
WL_O="wireless.@wifi-iface[5]"

#HPID="`ps |grep hostapd|head -1|awk '{print $1}'`"
#HPID="`ps |grep hostapd|grep hostapd-phy0.conf|tail -1|awk '{print $1}'`"
HPID="`ps |grep "[h]ostapd"|grep "[h]ostapd-phy0.conf"|awk '{print $1}'`"

#Main Net
if [ "$ACT" = "-A" ]

then

    if [ "$2" = "L" ]

    then
	ebtables -I INPUT -s $MAC -d $RLANMAC -j ACCEPT
	ebtables -A INPUT -s $MAC -d $RGUESTMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RSMARTMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RSUMPMAC -j DROP
	#uci set $WL_L.macfilter=allow
	#uci add_list $WL_L.maclist=$MAC
	#uci set $WL_O.macfilter=deny
	#uci add_list $WL_O.maclist=$MAC
	echo "$MAC" >> /tmp/run/hostapd-wlan0.maclist
	echo "$MAC" >> /tmp/run/hostapd-wlan0-3.maclist
	#wifi reload
	#uci commit wireless
	#kill -1 $HPID
	#hostapd_cli -i wlan0 reload
    fi

else

if [ "$ACT" = "-D" ]

then

    if [ "$2" = "L" ]

    then
    	ebtables -D INPUT -s $MAC -d $RLANMAC -j ACCEPT
	ebtables -D INPUT -s $MAC -d $RGUESTMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RSMARTMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RSUMPMAC -j DROP
	#uci set $WL_L.macfilter=allow
	#uci del_list $WL_L.maclist=$MAC
	#uci set $WL_O.macfilter=deny
	#uci del_list $WL_O.maclist=$MAC
	sed -i "/$MAC/d" /tmp/run/hostapd-wlan0.maclist
	sed -i "/$MAC/d" /tmp/run/hostapd-wlan0-3.maclist
	#wifi reload
	#uci commit wireless
	#kill -1 $HPID
	#hostapd_cli -i wlan0 reload
    fi

fi

fi
#End section

#Guest Net
if [ "$ACT" = "-A" ]

then

    if [ "$2" = "G" ]

    then
    	ebtables -I INPUT -s $MAC -d $RGUESTMAC -j ACCEPT
	ebtables -A INPUT -s $MAC -d $RLANMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RSMARTMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RSUMPMAC -j DROP
	#uci set $WL_G.macfilter=allow
	#uci add_list $WL_G.maclist=$MAC
	#uci set $WL_O.macfilter=deny
	#uci add_list $WL_O.maclist=$MAC
	echo "$MAC" >> /tmp/run/hostapd-wlan0-1.maclist
	echo "$MAC" >> /tmp/run/hostapd-wlan0-3.maclist
	#uci commit wireless
	#wifi reload
	#kill -1 $HPID
	#hostapd_cli -i wlan0-1 reload
    fi

else

if [ "$ACT" = "-D" ]

then

    if [ "$2" = "G" ]

    then
    	ebtables -D INPUT -s $MAC -d $RGUESTMAC -j ACCEPT
	ebtables -D INPUT -s $MAC -d $RLANMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RSMARTMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RSUMPMAC -j DROP
	#uci set $WL_G.macfilter=allow
	#uci del_list $WL_G.maclist=$MAC
	#uci set $WL_O.macfilter=deny
	#uci del_list $WL_O.maclist=$MAC
	sed -i "/$MAC/d" /tmp/run/hostapd-wlan0-1.maclist
	sed -i "/$MAC/d" /tmp/run/hostapd-wlan0-3.maclist
	#uci commit wireless
	#wifi reload
	#kill -1 $HPID
	#hostapd_cli -i wlan0-1 reload
    fi

fi

fi
#end section

#Smart Net
if [ "$ACT" = "-A" ]

then

    if [ "$2" = "S" ]

    then
    	ebtables -I INPUT -s $MAC -d $RSMARTMAC -j ACCEPT
	ebtables -A INPUT -s $MAC -d $RLANMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RGUESTMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RSUMPMAC -j DROP
	#uci set $WL_S.macfilter=allow
	#uci add_list $WL_S.maclist=$MAC
	#uci set $WL_O.macfilter=deny
	#uci add_list $WL_O.maclist=$MAC
	echo "$MAC" >> /tmp/run/hostapd-wlan0-2.maclist
	echo "$MAC" >> /tmp/run/hostapd-wlan0-3.maclist
	#uci commit wireless
	#wifi reload
	#kill -1 $HPID
	#hostapd_cli -i wlan0-2 reload
    fi

else

if [ "$ACT" = "-D" ]

then

    if [ "$2" = "S" ]

    then
    	ebtables -D INPUT -s $MAC -d $RSMARTMAC -j ACCEPT
	ebtables -D INPUT -s $MAC -d $RLANMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RGUESTMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RSUMPMAC -j DROP
	#uci set $WL_S.macfilter=allow
	#uci del_list $WL_S.maclist=$MAC
	#uci set $WL_O.macfilter=deny
	#uci del_list $WL_O.maclist=$MAC
	sed -i "/$MAC/d" /tmp/run/hostapd-wlan0-2.maclist
	sed -i "/$MAC/d" /tmp/run/hostapd-wlan0-3.maclist
	#uci commit wireless
	#wifi reload
	#kill -1 $HPID
	#hostapd_cli -i wlan0-2 reload
    fi

fi

fi
#End section


#Sump Net
if [ "$ACT" = "-A" ]

then

    if [ "$2" = "O" ]

    then
    	ebtables -I INPUT -s $MAC -d $RSUMPMAC -j ACCEPT
	ebtables -A INPUT -s $MAC -d $RLANMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RGUESTMAC -j DROP
	ebtables -A INPUT -s $MAC -d $RSMARTMAC -j DROP
	#hostapd_cli -i wlan0-3 reload
    fi

else

if [ "$ACT" = "-D" ]

then

    if [ "$2" = "O" ]

    then
    	ebtables -D INPUT -s $MAC -d $RSUMPMAC -j ACCEPT
	ebtables -D INPUT -s $MAC -d $RLANMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RGUESTMAC -j DROP
	ebtables -D INPUT -s $MAC -d $RSMARTMAC -j DROP
	#hostapd_cli -i wlan0-3 reload
    fi

fi

fi
#End section



echo "LAN" $RLANMAC
echo "GUEST" $RGUESTMAC
echo "SMART" $RSMARTMAC
echo "SUMP" $RSUMPMAC

echo  $HPID
