ebtables -F
ebtables -X
echo "00:00:00:01:01:01" > /var/run/hostapd-wlan0.maclist
echo "00:00:00:01:01:01" > /var/run/hostapd-wlan0-1.maclist
echo "00:00:00:01:01:01" > /var/run/hostapd-wlan0-2.maclist
echo "00:00:00:01:01:01" > /var/run/hostapd-wlan0-3.maclist
