#!/bin/bash
CONFIG_DIR=$HOME/.Xresources.d
mkdir -p $CONFIG_DIR

ln -sf $(pwd)/xinitrc $HOME/.xinitrc
ln -sf $(pwd)/Xresources $HOME/.Xresources
ln -sf $(pwd)/Xmodmap $HOME/.Xmodmap
ln -sf $(pwd)/Xresources.d $HOME/.Xresources.d
