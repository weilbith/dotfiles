# Install Zsh.
sudo apt-get install zsh # For Debian/Ubuntu
[[ -n "$(cat /etc/shells | grep zsh)" ]] && sudo chsh -s $(which zsh) # Set as default shell.

ZSH_DIR=$HOME/.config/zsh
mkdir -p $ZSH_DIR
ln -sf $(pwd)/* $ZSH_DIR/
ln -sf $(pwd)/.zshrc $HOME/

# Install Antibody and all Zsh plugins.
curl -sL git.io/antibody | sh -s
antibody bundle < $(pwd)/plugin-list.txt > $(pwd)/plugin-list.sh

# Install Powerlevel9k.
POWERLEVEL9K_DIR=$HOME/Tools/powerlevel9k
git clone --depth 1 https://github.com/weilbith/powerlevel9k.git $POWERLEVEL_9K_DIR

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


