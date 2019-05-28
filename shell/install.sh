BASE_DIRECTORY="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

# Install a bunch of small packages.
sudo pacman -S ripgrep fzf exa bat htop pdfgrep nmon openssh
trizen -S wuzz
pip install --user rtv

# Create XDG-Directories
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CACHE_HOME"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_RUNTIME_DIR"

# Install Kitty terminal emulator.
sudo pacman -S kitty
ln -sf "$BASE_DIRECTORY/kitty" "$XDG_CONFIG_HOME/"

# Install Antibody and all Zsh plugins (do so before zsh to get links work).
trizen -S antibody
antibody bundle <"$BASE_DIRECTORY/zsh/plugin-list.txt" >"$BASE_DIRECTORY/zsh/plugin-list.sh"

# Install Zsh
sudo pacman -S zsh zsh-completion
ln -sf "$BASE_DIRECTORY/zsh" "$XDG_CONFIG_HOME/"
mkdir -p "$XDG_DATA_HOME/zsh"
echo "ZDOTDIR=$XDG_CONFIG_HOME/zsh" | sudo tee -a /etc/zsh/zshenv # Avoid to have any Zsh directly at $HOME/
grep -q 'zsh' </etc/shells && sudo chsh -s "$(command -v zsh)"    # Set as default shell.

# Install TMux
sudo pacman -S tmux
ln -sf "$BASE_DIRECTORY/tmux" "$XDG_CONFIG_HOME/"
mkdir -p "$XDG_CACHE_HOME/tmux/tpm"

# Install TMux plugin manager.
TPM_DIR="$XDG_CACHE_HOME/tmux/plugins/tpm"
mkdir -p "$TPM_DIR"
git clone --depth 1 https://github.com/weilbith/tpm.git "$TPM_DIR"

# Powerstatus
# sudo pacman -S zsh-theme-powerlevel9k
trizen -S zsh-theme-powerlevel10k-git

# Install Cheat.sh
trizen -S cht.sh
ln -sf "$BASE_DIRECTORY/chtsh" "$XDG_CACHE_HOME/"

# Install Translate-Shell
trizen -S translate-shell
ln -sf "$BASE_DIRECTORY/translate-shell" "$XDG_CONFIG_HOME/"

# Fasd
echo "printf '\033[0;31mEdit the package source to the fork of \'whjvenyl\'\033[0m'"
trizen -S fasd-git
ln -sf "$BASE_DIRECTORY/fasd" "$XDG_CONFIG_HOME/"
mkdir -p "$XDG_DATA_HOME/fasd"

# Marker
MARKER_DIR="$HOME/Projects/marker"
mkdir -p "$MARKER_DIR"
git clone https://github.com/pindexis/marker.git "$MARKER_DIR"
cd "$MARKER_DIR" || return
python install.py
ln -sf "$BASE_DIRECTORY/marker" "$XDG_DATA_HOME/"

# Broot
trizen -S broot
ln -sf "$BASE_DIRECTORY/broot" "$XDG_CONFIG_HOME/"

# WGet
sudo pacman -S wget
ln -sf "$BASE_DIRECTORY/wget" "$XDG_CONFIG_HOME/"
mkdir -p XDG_CACHE_HOME/wget
