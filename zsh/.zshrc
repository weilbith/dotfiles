# Exports
export ZSH=$HOME/.oh-my-zsh
export XDG_DATA_HOME=$HOME/.config

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
source $XDG_DATA_HOME/zsh/oh-my-zsh_config-custom.zsh
source $XDG_DATA_HOME/zsh/powerlevel9k_config-custom.zsh
source $ZSH/oh-my-zsh.sh
# source $HOME/.fzf.zsh

# ---


# Aliases
source $XDG_DATA_HOME/zsh/alias.zsh

# ---


# Path

# ---
