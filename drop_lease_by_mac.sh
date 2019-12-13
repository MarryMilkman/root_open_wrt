sed -i "/$1/d" /tmp/dhcp.leases
/etc/init.d/dnsmasq restart
