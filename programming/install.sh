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

# LaTeX
sudo pacman -S texlive-most cmanminus
trizen -S python-proselint
sudo cpan -i YAML::Tiny File::HomeDir Unicode::GCString Log::Log4perl Log:Dispatch

