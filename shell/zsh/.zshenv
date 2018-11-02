# Basic Stuff
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=$EDITOR
export MAIL=$HOME/Mail

# XDG Standard
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/.runtime

# X-Server
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XSERVERRC=$XDG_CONFIG_HOME/X11/xserverrc

# Zsh related
#export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history

# MISC
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch/notmuchrc
