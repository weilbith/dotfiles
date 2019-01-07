# Basic Stuff
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=$EDITOR
export MAIL=$HOME/Mail
export TERM="xterm-256color"

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

# XDG adjustments for applications
## Config
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch/notmuchrc
export CHTSH_CONF=$XDG_CONFIG_HOME/chtsh/chtsh.conf
export ELINKS_CONFDIR=$XDG_CONFIG_HOME/elinks
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export WGETRC=$XDG_CONFIG_HOME/wget/wgetrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java

## Data
export NVM_DIR=$XDG_DATA_HOME/nvm
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export LESSHISTFILE=$XDG_DATA_DIR/less/history
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup

## Runtime
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export RXVT_SOCKET=$XDG_RUNTIME_DIR/urxvtd


# Path
export PATH=$PATH:~/.local/bin
