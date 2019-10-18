#!/bin/zsh

# Variables
SCRIPT_DIR=$HOME/.scripts # The directory where the scripts are placed.


# Function to create alias for each script in a defined folder.
# Filter the files which ends with a .sh or .zsh.
# Do not work recursive, so expect all scripts in the directories root.
# Arguments:
#   $1 - Folder to search for scripts
#
function createScriptAliases {
  local name
  local ext

  [[ ! -d "$1" ]] && return

  for file in $1/**/* ; do
    ext=$file:e

    if [[ ! -f "$file" ]]; then
      continue
    fi

    if [[ $ext = 'sh' || $ext = 'zsh' || $ext = 'py' || $ext = '' ]] ; then
      name=${${file:t}%.*}
      name_adjusted="${name/_/-}"
      alias -g $name_adjusted="$file"
    fi
  done
}


# Create aliases for private scripts.
createScriptAliases $SCRIPT_DIR

# Define some more alias manually.
command -v startx > /dev/null && alias -g startx="startx $XDG_CONFIG_HOME/X11/xinitrc"
command -v tmux > /dev/null && alias -g tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
command -v mbsync > /dev/null && alias -g mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc"
command -v exa > /dev/null && alias -g ls="exa"
command -v bat > /dev/null && alias -g cat="bat --paging never --theme DarkNeon"
command -v gpg > /dev/null && alias -g gpg="gpg --homedir $XDG_CONFIG_HOME/gnupg"

cursedtag="$HOME/Tools/cursedtag/cursedtag"
[[ -f "$cursedtag" ]] && alias -g ct="bash $cursedtag"
