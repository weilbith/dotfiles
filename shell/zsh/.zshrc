# Exports
export CONFIG_DIR=$HOME/.config/zsh
export TOOLS_DIR=$HOME/Tools

#---


# Standard ZSH Configurations
export LANG=en_US.UTF-8

# Set Vim as default editor.
export EDITOR=nvim

## User VIM style.
bindkey -v
setopt vi

## Reduce the delay on switching modes.
set KEYTIMEOUT=1

# ---


# Sourcing
source $CONFIG_DIR/antibody.zsh # Load plugins.
source $CONFIG_DIR/powerlevel9k-config.zsh # Prompt styling and segments.
source $CONFIG_DIR/plugin-config.zsh # All other configurations for plugins.
source /usr/share/fzf/key-bindings.zsh # Load fuzzy filter tools.
source /usr/share/fzf/completion.zsh # Load fuzzy filter tools.

# ---

#
# ZLE
# Start each prompt in vi nodemal mode.
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init

# Fix vi-escape issues at Arch-URxvt-TMux-Zsh
bindkey '\e' vi-cmd-mode

# ---


# NodeJS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---


# Rust
[[ -d $HOME/.cargo/bin ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env


# Aliases
source $CONFIG_DIR/alias.zsh # Auto-build alias for specific script folders.

# ---

# Start Environment
## Xorg
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx

## Start TMux on startup if it is available.
if command -v tmux>/dev/null; then
  # List of default TMux session names.
  SESSION_NAMES=(Berlin Amsterdam London Paris Rom Florence Edinburgh)

  # Wrapper function to start TMux.
  # As additional feature it defines the session name.
  # By using a configured set of default session names,
  # it takes the next name that isn't already in use.
  # If all session names are taken, the default TMux session name is used.
  #
  function startTmux {
    # Get the current list of sessions with their names.
    sessionList=$(tmux list-sessions 2> /dev/null)

    # Make sure any session is available.
    if [[ -n "$sessionList" ]] ; then
      # Search for unused session name.
      # Start with index 1, cause the first is used in the else case.
      for (( i=2; i<=${#SESSION_NAMES[@]}; i++ )) ; do
        current_name=${SESSION_NAMES[i]}
        used=$(echo "$sessionList" | grep "$current_name")

        if [[ -z "$used" ]] ; then
          name="$current_name"
          break
        fi
      done

    # First session so take he first name.
    else
      name=${SESSION_NAMES[1]}
    fi

    # Start TMux with session name or not.
    if [[ -n "$name" ]] ; then
      exec tmux new-session -s "$name"

    else
      exec tmux
    fi
  }

  # Make sure to do not nest TMux seesions.
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && startTmux
fi
