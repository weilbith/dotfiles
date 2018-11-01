# Music
## CMus
sudo pacman -S --noconfirm asla-lib
trizen -S cmus-git

CMUS_DIR=$HOME/.config/cmus
mkdir -p $CMUS_DIR
ln -sf $(pwd)/cmus/* $CMUS_DIR/

## Plex
trizen -S plex-media-player
# Open the application and link the device with the code.

## Tag-Editing
sudo pacman -S easytag


# Photos
sudo pacman -S gimp
trizen -S rawtherapee-git

# PDF
sudo pacman -S zathura zathura-pdf-mupdf tabbed
ZATHURA_DIR=$HOME/.config/zathura
ln -sf $(pwd)/zathurarc $ZATHURA_DIR/


# Video
sudo pacman -S vlc
# Select theme after start at Tools > Preferences > Interface > User custom skin
