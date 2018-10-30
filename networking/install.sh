#!/bin/bash

# Wicd
trizen -S wicd-patched
sudo gpasswd -a thore users
sudo chmod 600 $(pwc)/wicd/*.conf
sudo ln -sf $(pwd)/wicd/*.conf /etc/wicd/
sudo systemctl enable wicd.service
