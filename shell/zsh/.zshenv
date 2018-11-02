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
export CHTSH_CONF=$XDG_CONFIG_HOME/chtsh/chtsh.conf
export ELINKS_CONFDIR=$XDG_CONFIG_HOME/elinks
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export RXVT_SOCKET=$XDG_RUNTIME_DIR/urxvtd
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export LESSHISTFILE=$XDG_DATA_DIR/less/history
