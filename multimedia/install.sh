# Music
## CMus
sudo pacman -S --noconfirm asla-lib
trizen -S cmus-git
ln -sf $(pwd)/cmus $XDG_CONFIG_HOME/

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
ln -sf $(pwd)/zathura $XDG_CONFIG_HOME


# Video
sudo pacman -S vlc
# Select theme after start at Tools > Preferences > Interface > User custom skin
