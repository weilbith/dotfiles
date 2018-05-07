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

  for file in $1/* ; do
    ext=$file:e
    
    if [[ $ext = 'sh' || $ext = 'zsh' ]] ; then
      name=${${file:t}%.*}
      alias -g $name="$file"
    fi
  done
}


# Create aliases for private scripts.
createScriptAliases $SCRIPT_DIR
