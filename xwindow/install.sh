#!/bin/bash
CONFIG_DIR=$HOME/.Xresources.d
mkdir -p $CONFIG_DIR
ln -sf $(pwd)/Xresources $HOME/.Xresources
ln -sf $(pwd)/fonts $CONFIG_DIR/fonts
ln -sf $(pwd)/urxvt $CONFIG_DIR/urxvt

