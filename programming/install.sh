# Python
sudo pacman -S python-pip

# VimL
## Vint
pip install --user vim-vint
ln -sf $(pwd)/vintrc.yaml ~/.vintrc.yaml

# Rust
curl https://sh.rustup.rs -sSf | sh

# Docker
sudo pacman -S --noconfirm docker docker-compose
sudo groupadd -f docker
sudo usermod -aG docker $USER

# LaTeX
sudo pacman -S texlive-most cmanminus
trizen -S python-proselint
sudo cpan -i YAML::Tiny File::HomeDir Unicode::GCString Log::Log4perl Log:Dispatch

# CTags
sudo pacman -S --noconfirm universal_ctags-git
ln -sf $(pwd)/ctags $HOME/.ctags.d

# TOML
BIN_NAME="toml"
wget https://github.com/vmchale/tomlcheck/releases/download/0.1.0.37/tomlcheck-x86_64-unkown-linux-gnu > $BIN_NAME
sudo mv $BIN_NAME /usr/bin/
sudo chmod a+x /usr/bin/$BIN_NAME

# Shell/Bash/Zsh
sudo pacman -S shellcheck

# Editing
## NeoVim
trizen -S neovim-git
sudo pip install neovim
