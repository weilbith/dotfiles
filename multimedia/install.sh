# Music
# CMus
sudo pacman -S --noconfirm asla-lib
trizen -S cmus-git

CMUS_DIR=$HOME/.config/cmus
ln -sf $(pwd)/cmus/rc $CMUS_DIR/
ln -sf $(pwd)/cmus/blueplanet.theme $CMUS_DIR/

# Plex
trizen -S plex-media-player
# Open the application and link the device with the code.

# Tag-Editing
sudo pacman -S easytag

# PDF
sudo pacman -S evince
