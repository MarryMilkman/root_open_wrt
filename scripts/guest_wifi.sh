#!/bin/sh
uci set network.wifi_open=interface
uci set network.wifi_open.type=bridge
uci set network.wifi_open.proto=static
uci set network.wifi_open.ipaddr=10.1.1.1
uci set network.wifi_open.netmask=255.255.255.0

uci add wireless wifi-iface
uci set wireless.@wifi-iface[-1].device=radio0
uci set wireless.@wifi-iface[-1].mode=ap
uci set wireless.@wifi-iface[-1].ssid=Guest_test
uci set wireless.@wifi-iface[-1].network=Guest_test
uci set wireless.@wifi-iface[-1].encryption=none
uci set wireless.@wifi-iface[-1].isolate=1

uci set dhcp.wifi_open=dhcp
uci set dhcp.wifi_open.interface=Guest_test
uci set dhcp.wifi_open.start=2
uci set dhcp.wifi_open.limit=253
uci add_list dhcp.wifi_open.dhcp_option=6,10.1.1.1
uci set dhcp.wifi_open.leasetime=1h

uci add firewall zone
uci set firewall.@zone[-1].name=wifi_open
uci add_list firewall.@zone[-1].network=Guest_test
uci set firewall.@zone[-1].input=REJECT
uci set firewall.@zone[-1].forward=REJECT
uci set firewall.@zone[-1].output=ACCEPT

uci add firewall forwarding
uci set firewall.@forwarding[-1].src=Guest_test
uci set firewall.@forwarding[-1].dest=wan

uci add firewall rule
uci set firewall.@rule[-1].name=icmp-echo-request
uci set firewall.@rule[-1].src=Guest_Test
uci set firewall.@rule[-1].target=ACCEPT
uci set firewall.@rule[-1].proto=icmp
uci set firewall.@rule[-1].icmp_type=echo-request

uci add firewall rule
uci set firewall.@rule[-1].name=dhcp
uci set firewall.@rule[-1].src=Guest_test
uci set firewall.@rule[-1].target=ACCEPT
uci set firewall.@rule[-1].proto=udp
uci set firewall.@rule[-1].src_port=67-68
uci set firewall.@rule[-1].dest_port=67-68

uci add firewall rule
uci set firewall.@rule[-1].name=dns
uci set firewall.@rule[-1].src=Guest_test
uci set firewall.@rule[-1].target=ACCEPT
uci set firewall.@rule[-1].proto=tcpudp
uci set firewall.@rule[-1].dest_port=53
