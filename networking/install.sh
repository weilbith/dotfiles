#!/bin/bash

# NetworkManager
sudo pacman -S networkmanager
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManager-dispatcher.servive
sudo systemctl start NetworkManager-dispatcher.servive
sudo cp "$(pwd)/network-manager/dispatcher.d/*" /etc/NetworkManager/dispatcher.d/
sudo chown -R root:root /etc/NetworkManager/dispatcher.d/
sudo chmod -R 755 /etc/NetworkManager/dispatcher.d/

# MacChanger
sudo pacman -S macchanger

# Bluetooth
trizen -S bluez bluez-utils pulseaudio-bluetooth
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Printing
sudo pacman -S cups avahi nss-mdns 
sudo systemctl enable avahi-daemon.service
sudo systemctl start avahi-daemon.service
sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service
# TODO: /etc/nsswitch.conf file must be adjusted.
