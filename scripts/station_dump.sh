#iw dev wlan0 station dump | grep Station | awk '{print $2 " "}' > List_device

#iw dev wlan0 station dump |grep -E 'Station|signal'

#iw dev wlan0 station dump |grep -E 'Station|signal'  | awk '{print $2 " "}'| awk '{ printf "%s",$1 }'


#/bin/sh

echo "Stations on 2.4G"
#iw dev wlan0-1 station dump | grep Station | awk '{print $2 " "}' | head -2 > List_devices-2.4G

#iw dev wlan0-1 station dump |grep -E 'Station|signal'  | head -2
#echo "______________________________________________"
#iw dev wlan0-1 station dump |grep -E 'Station|signal'  | awk '{print $2 " "}' |head -2

iw dev wlan0 station dump |grep -E 'Station|signal:|connected time:|inactive time:' | awk '{gsub("\t", "");print}'

iw dev wlan0-1 station dump |grep -E 'Station|signal:|connected time:|inactive time:' | awk '{gsub("\t", "");print}'

 
iw dev wlan0-2 station dump |grep -E 'Station|signal:|connected time:|inactive time:' | awk '{gsub("\t", "");print}'

iw dev wlan0-3 station dump |grep -E 'Station|signal:|connected time:|inactive time:' | awk '{gsub("\t", "");print}'


#echo "______________________________________________"


echo "Stations on 5G"



#iw dev wlan1 station dump |grep -E 'Station|signal:|connected time:|inactive time:' | awk '{gsub("\t", "");print}' 

#iw dev wlan1-3 station dump |grep -E 'Station|signal:|connected time:|inactive time:' | awk '{gsub("\t", "");print}'

#iw dev wlan1-4 station dump |grep -E 'Station|signal:|connected time:|inactive time:' | awk '{gsub("\t", "");print}'

#iw dev wlan1 station dump | grep Station | awk '{print $2 " "}'  | head -2 > List_devices-5G

#iw dev wlan1 station dump |grep -E 'Station|signal'  | head -2
#echo "______________________________________________"
#iw dev wlan1 station dump |grep -E 'Station|signal'  | awk '{print $2 " "}' |head -2


#iw dev wlan1 station dump |grep -E 'Station|signal'  | awk '{print $2 " "}' | awk '{ printf "%s",$1 }'

#iwinfo



