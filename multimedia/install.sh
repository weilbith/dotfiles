# Music
# CMus
sudo pacman -S --noconfirm asla-lib
trizen -S cmus-git

CMUS_DIR=$HOME/.config/cmus
mkdir -p $CMUS_DIR
ln -sf $(pwd)/cmus/* $CMUS_DIR/

# Plex
trizen -S plex-media-player
# Open the application and link the device with the code.

# Tag-Editing
sudo pacman -S easytag

# PDF
sudo pacman -S evince
