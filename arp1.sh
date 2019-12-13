
#ip neigh flush all
#arptables -v -D INPUT --source-mac 10:8e:e0:ed:19:a6 -j DROP
#ebtables -A INPUT -s 10:8e:e0:ed:19:a6 -j DROP
ebtables -A INPUT -s $1 -j DROP



