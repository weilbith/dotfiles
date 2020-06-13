# Get an instant prompt
local prompt_cache_file="$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"

if [[ -r "$prompt_cache_file" ]]; then
  source "$prompt_cache_file"
fi

# ---


# Zsh specific configurations
bindkey -v
setopt vi

set KEYTIMEOUT=1 # Reduce the delay on switching modes.

autoload -Uz compinit
compinit -d $XDG_DATA_HOME/zsh/zcompdump-$ZSH_VERSION

# ---


# Sourcing
type "fzf" > /dev/null && source "$XDG_CONFIG_HOME/fzf/setup.sh" # First, since some plugins depend on it.
type "antibody" > /dev/null && source "$XDG_CONFIG_HOME/antibody/setup.zsh"
type "fasd" > /dev/null && source "$XDG_CONFIG_HOME/fasd/setup.sh"
type "ssh" > /dev/null && source "$HOME/.ssh/enable_cache.sh"

source $ZDOTDIR/alias.zsh
source $ZDOTDIR/widgets.zsh

# type "tmux" > /dev/null && source "$XDG_CONFIG_HOME/tmux/start_session.sh"


# ---


# ZLE
## Start each prompt in vi normal mode.
## Have to be done after the oh-my-zsh vi-plugin has been sourced.
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init

bindkey '\e' vi-cmd-mode # Fix vi-escape issues at Arch-URxvt-TMux-Zsh

#---


# Path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/home/thore/.local/share/cargo/bin"
export PATH="$N_PREFIX/bin:$PATH"  # Put in front to overwrite default location

# ---
