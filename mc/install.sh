sudo pacman -S --noconfirm mc
$CONFIG_DIR=$HOME/.local/share/mc/
mkdir -p $CONFIG_DIR/skins
ln -sf $(pwd)/blue_planet.ini $CONFIG_DIR/skins/
ln -sf $(pwd)/ini $HOME/.config/mc/
ln -sf $(pwd)/mc.keymap $HOME/.config/mc/

