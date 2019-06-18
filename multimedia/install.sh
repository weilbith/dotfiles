# Music
## CMus
# sudo pacman -S --noconfirm asla-lib
# trizen -S cmus-git
# ln -sf $(pwd)/cmus $XDG_CONFIG_HOME/

## Mopidy
trizen -S mopidy
pip install Mopidy-Local-SQLite Mopidy-YouTube
ln -sf "$(pwd)/mopidy" "$XDG_CONFIG_HOME/"

## Ncmpcpp
sudo pacman -S ncmpcpp
ln -sf "$(pwd)/ncmpcpp" "$XDG_CONFIG_HOME/"
mkdir -p "$XDG_CONFIG_HOME/ncmpcpp"

## Tag-Editing
# sudo pacman -S easytag
git clone https://github.com/hellricer/cursedtag.git "$HOME/Tools/cursedtag"
trizen -S mutagen-git

# Photos
sudo pacman -S gimp feh
trizen -S rawtherapee-git
ln -sf $(pwd)/feh $XDG_CONFIG_HOME/

# PDF
sudo pacman -S zathura zathura-pdf-mupdf tabbed
ln -sf $(pwd)/zathura $XDG_CONFIG_HOME/

# Video
sudo pacman -S vlc
# Select theme after start at Tools > Preferences > Interface > User custom skin
