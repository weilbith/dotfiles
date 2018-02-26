# Exports
## Paths
export XDG_DATA_HOME=$HOME/.config
export ANTIGEN=$HOME/.antigen

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
source $XDG_DATA_HOME/zsh/powerlevel9k_config-custom.zsh
source $ANTIGEN/antigen.zsh
source $XDG_DATA_HOME/zsh/antigen_config-custom.zsh
source $XDG_DATA_HOME/zsh/plugins_config-custom.zsh
# source $HOME/.fzf.zsh

# ---


# Aliases
source $XDG_DATA_HOME/zsh/alias.zsh

# ---


# Path

# ---
