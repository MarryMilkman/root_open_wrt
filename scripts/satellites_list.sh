#!/bin/sh

cat /proc/net/arp |grep br-lan|awk '{print ""$4 " " $1 ""}'
