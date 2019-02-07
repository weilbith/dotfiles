# Install a bunch of small packages.
sudo pacman -S zsh-theme-powerlevel9k ripgrep fzf exa bat htop pdfgrep nmon openssh
trizen -S wuzz
pip install --user rtv

# Create XDG-Directories
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_RUNTIME_DIR

# Install Kitty terminal emulator.
sudo pacman -S kitty
ln -sf $(pwd)/kitty $XDG_CONFIG_HOME/


# Install Antibody and all Zsh plugins (do so before zsh to get links work).
trizen -S antibody
antibody bundle < $(pwd)/zsh/plugin-list.txt > $(pwd)/zsh/plugin-list.sh

# Install Zsh
sudo pacman -S zsh zsh-completion
ln -sf $(pwd)/zsh $XDG_CONFIG_HOME/
mkdir -p $XDG_DATA_HOME/zsh
sudo echo "ZDOTDIR=$XDG_CONFIG_HOME/zsh" >> /etc/zsh/zshenv # Avoid to have any Zsh directly at $HOME/
[[ -n "$(cat /etc/shells | grep zsh)" ]] && sudo chsh -s $(which zsh) # Set as default shell.

# Install TMux
sudo pacman -S tmux
ln -sf $(pwd)/tmux $XDG_CONFIG_HOME/
mkdir -p $XDG_CACHE_HOME/tmux/tpm

# Install TMux plugin manager.
TPM_DIR=$XDG_CACHE_HOME/tmux/plugins/tpm
mkdir -p $TPM_DIR
git clone --depth 1 https://github.com/weilbith/tpm.git $TPM_DIR

# Install Cheat.sh
sudo pacman -S xsel rlwrap
CHT_DIR=$HOME/Tools/chtsh
mkdir -p $CHT_DIR
curl https://cht.sh/:cht.sh > $CHT_DIR/cht.sh
chmod +x $CHT_DIR/cht.sh
ln -sf $(pwd)/chtsh $XDG_CACHE_HOME/

# Install Translate-Shell
trizen -S translate-shell
ln -sf $(pwd)/translate-shell $XDG_CONFIG_HOME/

# Fasd
sudo pacman -S fasd-git
ln -sf $(pwd)/fasdrc ~/.fasdrc
mkdir -p $XDG_DATA_HOME/fasd

# WGet
sudo pacman -S wget
ln -sf $(pwd)/wget $XDG_CONFIG_HOME/
mkdir -p XDG_CACHE_HOME/wget
