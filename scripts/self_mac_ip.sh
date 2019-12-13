#!/bin/sh

ethtool  -P eth1|awk '{print "" $3 ""}'
ip a|grep br-lan| grep inet| head -1| awk '{print "" $2 ""}'| awk -F/ '{print "" $1 ""}'

#cat /proc/net/arp |grep br-vlan99|awk '{print ""$4 " " $1 ""}'
