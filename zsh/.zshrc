# Exports
export CONFIG_DIR=$HOME/.config/zsh

# ---


# Standard ZSH Configurations
export LANG=en_US.UTF-8

# Set Vim as default editor.
export EDITOR=nvim

## User VIM style.
bindkey -v

## Reduce the delay on switching modes (0.x seconds, default 0.4)
set KEYTIMEOUT=1

# ---


# Source
source $CONFIG_DIR/antibody.zsh # Load plugins.
source $CONFIG_DIR/powerlevel9k-config.zsh # Prompt styling and segments.
source $CONFIG_DIR/plugin-config.zsh # All other configurations for plugins.
# source $HOME/.fzf.zsh

# ---


# Aliases
source $CONFIG_DIR/alias.zsh # Auto-build alias for specific script folders.

# ---


# ZLE
# Start each prompt in vi nodemal mode.
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init

# ---


# NodeJS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---


# Start TMux on startup if it exist.
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
