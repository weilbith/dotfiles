#!/bin/bash
#
# Script to change the MAC-address every time before connecting to anew network.
# This requires the macchanger tool.

# Parse parameter.
CONNECTION_TYPE="$1"

# Define link names
WLAN_LINK="wlp4s0"
LAN_LINK="enp0s31f6"


# Change the links address depending on the connection type.
if [[ "${CONNECTION_TYPE}" == "wireless" ]]; then
  ip link set $WLAN_LINK down
  macchanger -A $WLAN_LINK
  ip link set $WLAN_LINK up

elif [[ "${CONNECTION_TYPE}" == "wired" ]]; then
  ip link set $LAN_LINK down
  macchanger -A $LAN_LINK
  ip link set $LAN_LINK up
fi
