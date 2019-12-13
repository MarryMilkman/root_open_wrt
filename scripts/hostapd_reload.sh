#!/bin/sh

kill -1 `ps |grep hostapd|grep phy0| awk '{print $1 " "}'`
kill -1 `ps |grep hostapd|grep phy1| awk '{print $1 " "}'`
