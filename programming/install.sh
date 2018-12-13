# Python
sudo pacman -S python-pip

## Flake8/Pep8
pip install --user flake8 pep8 pep8-naming

## AutoPep8
pip install --user autopep8
ln -sf $(pwd)/.pycodestyle $XDG_CONFIG_HOME/

## Jedi
pip install --user jedi

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

## Markdown2Ctags
git clone --depth 1 https://github.com/jszakmeister/markdown2ctags.git $HOME/Tools/

# TOML
BIN_NAME="toml"
wget https://github.com/vmchale/tomlcheck/releases/download/0.1.0.37/tomlcheck-x86_64-unkown-linux-gnu > $BIN_NAME
sudo mv $BIN_NAME /usr/bin/
sudo chmod a+x /usr/bin/$BIN_NAME

# Shell/Bash/Zsh
sudo pacman -S shellcheck

# JSON
yarn global add jsonlint

# Editing
## NeoVim
trizen -S neovim-git
sudo pip install neovim

## EditorConfig
sudo pacman -S editorconfig-core-c
