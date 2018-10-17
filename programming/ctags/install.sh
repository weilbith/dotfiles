sudo pacman -S --noconfirm universal_ctags-git

CTAGS_DIR=$HOME/.ctags.d
mkdir -p $CTAGS_DIR
ln -sf $(pwd)/*.ctags $CTAGS_DIR/
