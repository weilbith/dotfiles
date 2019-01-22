#!/bin/bash

# Install packages.
sudo pacman -S xorg xsel xclip xautolock compoton dmenu pulseaudio dex xdg-user-dirs xdotool
trizen -S i3lock-color nerd-fonts-source-code-pro rxvt-unicode-patched 

# Xresources
CONFIG_DIR=$HOME/.Xresources.d
mkdir -p $CONFIG_DIR

ln -sf $(pwd)/xinitrc $HOME/.xinitrc
ln -sf $(pwd)/Xresources $HOME/.Xresources
ln -sf $(pwd)/Xmodmap $HOME/.Xmodmap
ln -sf $(pwd)/Xresources.d $HOME/.Xresources.d

# i3
sudo pacman -S i3-gaps
ln -sf $(pwd)/i3 $XDG_CONFIG_HOME/

# Dunst
sudo pacman -S --noconfirm dunst
ln -sf $(pwd)/dunst $XDG_CONFIG_HOME/

# RedShift
trizen -S redshift-minimal
ln -sf $(pwd)/redshift $XDG_CONFIG_HOME/

# Link desktop files for CLI based applications.
sudo ln -sf $(pwd)/desktop-files/* /usr/share/applications/

# Autostart
ln -sf $(pwd)/autostart $XDG_CONFIG_HOME/

# User directories
ln -sf $(pwd)/user-dirs/* $XDG_CONFIG_HOME/

# SSH
mkdir -p $XDG_CACHE_HOME/ssh
ln -sf $(pwd)/ssh/config $HOME/.ssh/config


# Messy stuff
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

ln -sf $(pwd)/powerstatus10k/powerstatus10k.conf $POWERSTATUS10K_DIR/config/custom.conf
