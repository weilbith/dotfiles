function load_external_source_file() {
  local external_source_file="$1"
  set -a
  # shellcheck disable=SC1090
  source "$external_source_file"
  set +a
}

function load_external_source_directory() {
  local external_source_directory="$1"
  local external_source_file_list
  external_source_file_list=$(find -L "$external_source_directory" -type f)

  while read -r external_source_file; do
    load_external_source_file "$external_source_file"
  done <<<"$external_source_file_list"
}

function load_external_source() {
  local external_source="$1"
  [[ -d "$external_source" ]] && load_external_source_directory "$external_source"
  [[ -f "$external_source" ]] && load_external_source_file "$external_source"
}

load_external_source "$HOME/.config/environment.d"
# load_external_source "$HOME/.config/user-dirs.dirs"

# Zsh specific
## Note the ZDOTDIR variable in /etc/zsh/zshenv
export HISTFILE=$XDG_DATA_HOME/zsh/history

# Alias
## Source them here for supporting non-interactive shells
## The problem is that the `.zshrc` is only loaded in interactive mode.
## Processes like i3, xbindkeys, xautolock etc. will/can not spawn an
## interactive Zsh. But they need access to the aliases.
source $ZDOTDIR/alias.zsh
