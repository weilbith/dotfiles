# Install a bunch of small packages.
sudo pacman -S zsh-theme-powerlevel9k ripgrep fzf fasd-git exa bat htop pdfgrep nmon openssh
trizen -S wuzz
pip install --user rtv

# Install Antibody and all Zsh plugins (do so before zsh to get links work).
trizen -S anitbody
antibody bundle < $(pwd)/zsh/plugin-list.txt > $(pwd)/zsh/plugin-list.sh
chmod +x $(pwd)/zsh/*

# Install Zsh.
sudo pacman -S zsh zsh-completion
[[ -n "$(cat /etc/shells | grep zsh)" ]] && sudo chsh -s $(which zsh) # Set as default shell.

ZSH_DIR=$HOME/.config/zsh
mkdir -p $ZSH_DIR
ln -sf $(pwd)/zsh/* $ZSH_DIR/
ln -sf $(pwd)/zsh/.zshrc $HOME/

# Install TMux
sudo pacman -S tmux
ln -sf $(pwd)/tmux.conf ~/.tmux.conf

# Install TMux plugin manager.
TPM_DIR=$HOME/.tmux/plugins/tpm
mkdir -p $TPM_DIR
git clone --depth 1 https://github.com/tmux-plugins/tpm $TPM_DIR

# Install Cheat.sh
sudo pacman -S xsel rlwrap
CHT_DIR=$HOME/Tools/chtsh
mkdir -p $CHT_DIR
curl https://cht.sh/:cht.sh > $CHT_DIR/cht.sh
chmod +x $CHT_DIR/cht.sh

# Install Translate-Shell
trizen -S translate-shell
TS_DIR=$HOME/.translate-shell
mkdir -p $TS_DIR
ln -sf $(pwd)/*.trans $TS_DIR/
