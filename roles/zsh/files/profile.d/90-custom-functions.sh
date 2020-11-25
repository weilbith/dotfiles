# Extend the base `man` program .
# If there is no manual page entry for the given name, attempt execute the name
# and pass the `--help` parameter. The result gets displayed in a pager if there
# is any.
#
# $1 - name to get manual or help for
#
function man() {
  if ! /usr/bin/man "$1" 2>/dev/null; then
    local help
    help="$($1 --help 2>/dev/null)"

    if [[ -n "$help" ]]; then
      echo "$help" | less
    else
      echo "No man page nor help command available!"
      return 1
    fi
  fi
}

# Wrapper around make directory that automatically changes into the newly
# created directory. Subdirectories get created automatically. If the given path
# matches the name `tmp`, instead a temporally directory gets created with
# the `mktemp` programm.
#
# $1 - director(ies) to create and change to (`tmp` as special case)
#
function take() {
  local directory

  if [[ "$1" = "tmp" ]]; then
    directory=$(mktemp --directory)
  else
    mkdir --parents "$1"
    directory="$1"
  fi

  # TODO: How to handle multiple parameters?
  cd "$directory" || return 1
}
