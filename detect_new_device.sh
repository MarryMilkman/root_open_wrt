#!/bin/sh

# Add to /etc/dnsmasq.conf in  dhcp-script=/root/detect_new_device.sh


if [ "$1" == "add" ]; then
  msg="New device on `uci get system.@system[0].hostname`.`uci get dhcp.@dnsmasq[0].domain` $*"
  echo `date` $msg >> /tmp/dhcpmasq.log

  sed -i "/$2/d" /root/server_client_info/leases_info.txt
  echo $2 $3 $4 >> /root/server_client_info/leases_info.txt

  info=`/root/stations_active.sh | grep $2`

  if [ $2 != "$info" ]
    then
      echo "1" $2 "e" `date +%s`  >> /root/server_client_info/connection_log.txt
#  else
#	echo "1" $2 "w" `date +%s`  >> /root/server_client_info/connection_log.txt
  fi

  echo $msg | sed s/:/-/g >> /root/new_device.log

 # echo "1" $2 "e" `date +%s`  >> /root/server_client_info/connection_log.txt

#  echo "ethernet" >> /root/server_client_info/connection_log.txt
#  echo `date` >> /root/server_client_info/connection_log.txt 
#  echo "DHCP" >> /root/server_client_info/connection_log.txt 

fi

if [ "$1" == "del" ]; then
  sed -i "/$2/d" /root/server_client_info/leases_info.txt
fi
