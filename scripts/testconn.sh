#!/bin/sh

#Usage OUT=/tmp/111 hostapd_cli -i wlan0 -a /root/test.sh $4  Where OUT="Your output file"


SN=`ethtool -P eth1 | awk '{print $3 ""}'`

DATE=`date +%s`


if [[ $2 == "AP-STA-CONNECTED" ]]
then
  echo "Connect wifi!" 
  echo "1 $3 $1 ${DATE}" >> $OUT
fi

if [[ $2 == "AP-STA-DISCONNECTED" ]]
then
  echo "Disconnect wifi!"
  echo "0 $3 $1 ${DATE}" >> $OUT
  #/root/drop_lease_by_mac.sh $3
fi

