echo start ping $1

while ping -c1 $1 &>/dev/null
        do sleep 1s

done

echo 'Disconnect'
