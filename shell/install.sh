# Install Antibody and all Zsh plugins (do so before zsh to get links work).
curl -sL git.io/antibody | sh -s
antibody bundle < $(pwd)/zsh/plugin-list.txt > $(pwd)/zsh/plugin-list.sh
chmod +x $(pwd)/zsh/*

# Install Zsh.
sudo apt-get install zsh # For Debian/Ubuntu
[[ -n "$(cat /etc/shells | grep zsh)" ]] && sudo chsh -s $(which zsh) # Set as default shell.

ZSH_DIR=$HOME/.config/zsh
mkdir -p $ZSH_DIR
ln -sf $(pwd)/zsh/* $ZSH_DIR/
ln -sf $(pwd)/zsh/.zshrc $HOME/


# Install Powerlevel9k.
POWERLEVEL9K_DIR=$HOME/Tools/powerlevel9k
mkdir -p $POWERLEVEL9K_DIR
git clone --depth 1 https://github.com/weilbith/powerlevel9k.git $POWERLEVEL9K_DIR

# Install TMux
sudo apt-get install tmux # For Debian/Ubuntu
ln -sf $(pwd)/tmux.conf ~/.tmux.conf

# Install TMux plugin manager.
TPM_DIR=$HOME/.tmux/plugins/tpm
mkdir -p $TPM_DIR
git clone --depth 1 https://github.com/tmux-plugins/tpm $TPM_DIR

# Install RipGrep.
RG_DEB=/tmp/ripgrep.deb
curl -L https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb > $RG_DEB
sudo dpkg -i ripgrep_0.8.1_amd64.deb

# Install Fzf
FZF_DIR=$HOME/Tools/fzf
mkdir -p $FZF_DIR
git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_DIR
bash $FZF_DIR/install
mv ~/.fzf* $FZF_DIR/

# Install Exa
EXA_DIR=$HOME/Tools/exa
mkdir -p $EXA_DIR
git clone --depth 1 https://github.com/ogham/exa.git $EXA_DIR
cd $EXA_DIR
sudo cargo install --no-default-features exa # Do not use the git feature, what requires a extra library.

# Install Bat
BAT_DIR=$HOME/Tools/bat
mkdir -p $BAT_DIR
git clone --depth 1 https://github.com/sharkdp/bat.git $BAT_DIR
cd $BAT_DIR
cargo install bat

# Install Reddit Terminal-Viewer
pip install --user rtv

# Install Cheat.sh
sudo apt-get install xsel rlwrap
CHT_DIR=$HOME/Tools/chtsh
mkdir -p $CHT_DIR
curl https://cht.sh/:cht.sh > $CHT_DIR/cht.sh
curl https://cht.sh/:zsh > $CHT_DIR/zsh-completion.sh
chmod +x $CHT_DIR/cht.sh

# Install BashMount
BM_DIR=$HOME/Tools/bashmount
BM_CONFIG_DIR=$HOME/.config/bashmount
mkdir -p $BM_DIR
mkdir -p $BM_CONFIG_DIR
git clone --depth 1 https://github.com/jamielinux/bashmount.git $BM_DIR
cd $BM_DIR
sudo install -m755 bashmount /usr/bin/bashmount
ln -sf $(pwd)/bashmount.conf $BM_CONFIG_DIR/config

# Install Wuzz
WUZZ_DEST=/usr/bin/wuzz
WUZZ_SOURCE=$(curl -s https://api.github.com/repos/asciimoo/wuzz/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux_amd64)
sudo bash -c "curl -L $WUZZ_SOURCE > $WUZZ_DEST"
sudo chmod +x $WUZZ_DEST

# Install some packages as tools for the shell.
sudo apt-get install -y htop
sudo apt-get install -y pdfgrep
