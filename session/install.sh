#!/bin/bash

# Install packages.
sudo pacman -S xorg xsel xclip xautolock i3-gaps compoton dmenu pulseaudio dex
trizen -S i3lock-color nerd-fonts-source-code-pro rxvt-unicode-patched 

# Xresources
CONFIG_DIR=$HOME/.Xresources.d
mkdir -p $CONFIG_DIR

ln -sf $(pwd)/xinitrc $HOME/.xinitrc
ln -sf $(pwd)/Xresources $HOME/.Xresources
ln -sf $(pwd)/Xmodmap $HOME/.Xmodmap
ln -sf $(pwd)/Xresources.d $HOME/.Xresources.d

# i3 configuration
I3_CONFIG_DIR=$HOME/.config/i3
mkdir -p $I3_CONFIG_DIR
ln -sf $(pwd)/i3config $I3_CONFIG_DIR/config


# Install Powerstatus10k
POWERSTATUS10K_DIR=$HOME/Tools/powerstatus10k

if [[ ! -d "$POWERSTATUS10K_DIR" ]] ; then
  mkdir -p $POWERSTATUS10K_DIR
  git clone --depth 1 --recurse-submodules https://github.com/weilbith/powerstatus10k.git $POWERSTATUS10K_DIR
  base=$(pwd)
  cd $POWERSTATUS10K_DIR/bar
  sudo make
  sudo make install
  cd $base
fi

ln -sf $(pwd)/powerstatus10k_custom.conf $POWERSTATUS10K_DIR/config/custom.conf
chmod +x $POWERSTATUS10K_DIR/powerstatus10k.sh

# Dunst
sudo pacman -S --noconfirm dunst
DUNST_CONFIG_DIR=$HOME/.config/dunst/
mkdir -p $DUNST_CONFIG_DIR
ln -sf $(pwd)/dunstrc $DUNST_CONDIG_DIR

# RedShift
trizen -S redshift-minimal
RS_DIR=$HOME/.config/redshift
mkdir -p $RS_DIR
ln -sf $(pwd)/redshift.conf $RS_DIR/

# Cerebro
# Install dependencies.
sudo pacman -S nodejs yarn fuse readline

# Configuration
CEREBRO_DIR=$HOME/.config/Cerebro
mkdir -p $CEREBRO_DIR
ln -sf $(pwd)/cerebro/config.json $CERBRO_DIR/

# Start the application ones to create some stuff at the configuration directory.
ln -sf $(pwd)/cerebro/plugins.json $CEREBRO_DIR/plugins/package.json
cd $CEREBRO_DIR/plugins
yarn install


# Link desktop files for CLI based applications.
sudo ln -sf $(pwd)/desktop-files/* /usr/share/applications/

# Autostart
ln -sf $(pwd)/autostart $HOME/.config/
