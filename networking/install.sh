#!/bin/bash

# Wicd
trizen -S wicd-patched
sudo chmod -R 600 $(pwd)/wicd/*
sudo chmod -R 700 $(pwd)/wicd/scripts/*
sudo ln -sf $(pwd)/wicd/* /etc/wicd/
sudo gpasswd -a thore users
sudo systemctl enable wicd.service

# MacChanger
