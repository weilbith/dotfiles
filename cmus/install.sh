sudo pacman -S --noconfirm asla-lib
trizen -S cmus-git

CMUS_DIR=$HOME/.config/cmus
ln -sf $(pwd)/rc $CMUS_DIR/
ln -sf $(pwd)/autosave $CMUS_DIR/
