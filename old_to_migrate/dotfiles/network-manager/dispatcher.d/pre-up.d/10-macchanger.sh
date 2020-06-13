#!/bin/bash

interface="$1"
interface_wired="enp0s31f6"
interface_wireless="wlp4s0"

# Dop out for the wired and wireless interface.
[[ "$interface" != "$interface_wired" ]] \
	&& [[ "$interface" != "$interface_wireless" ]] \
	&& return

ip link set "$interface" down
macchanger -A "$interface"
ip link set "$interface" up
