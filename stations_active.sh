#!/bin/sh

/root/scripts/station_dump.sh |grep -E "Station\s"|awk '{print $2}'
