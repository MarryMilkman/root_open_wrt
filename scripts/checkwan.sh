#!/bin/sh

IFSTATE1=`ethtool eth1 |tail -1 |awk '{print ""$3 ""}'`

if [ "$IFSTATE1" = "yes" ]

then
       echo "1"
fi

if [ "$IFSTATE1" = "no" ]

then
       echo "0"
fi

