# shellcheck disable=1090

# Setup
FASD_CACHE="${ZSH_CACHE_DIR}/fasd-init-cache"
FASD_OPTIONS="posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install"

if [[ "$(command -v fasd)" -nt "$FASD_CACHE" ]] || [[ ! -s "$FASD_CACHE" ]]; then
  fasd --init "$FASD_OPTIONS" >|"$FASD_CACHE"
fi

source "$FASD_CACHE"

# Mappings
bindkey '^[f' fasd_fzf_file_selection      # Alt + f
bindkey '^[d' fasd_fzf_directory_selection # Alt + d
