#!/bin/sh

interface=$1
status=$2

echo "Interface: $interface" >> /tmp/test_nm
echo "Status: $status" >> /tmp/test_nm
# if [ "$status" = "up" ]; then
#   ip link set "$interface" down
#   macchanger -A "$interface"
#   ip link set "$interface" up
# fi
