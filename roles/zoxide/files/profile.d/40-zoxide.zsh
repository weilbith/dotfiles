# This profile should be loaded before the profile loading the auto-completion
# plugin. Else the auto-completion for zoxide will not work.

eval "$(zoxide init zsh)"

function __is_child_of_directory() {
  local child_candidate="$(realpath $1)"
  local directory="$(realpath $2)"

  [[ ! -e "$child_candidate" || ! -d "$directory" ]] && return 1

  local directory_on_child_path="$child_candidate"

  while [[ "$directory_on_child_path" != "/" ]]; do
    [[ "$directory_on_child_path" == "$directory" ]] && return 0
    directory_on_child_path="$(dirname "$directory_on_child_path")"
  done

  return 1
}

function __get_git_root_directory_if_inside_worktree() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    for worktree in $(git worktree list); do
      if __is_child_of_directory "$PWD" "$worktree"; then
        echo "$worktree"
        return 0
      fi
    done
  fi
}

# Jump relative to the current git repository.
# The current working directory can be somewhere inside of the worktree.
# This takes into account (and is especially useful for) repositories with
# multiple local worktrees.
function zg() {
  local git_directory="$(__get_git_root_directory_if_inside_worktree)/"

  if [[ -z "$git_directory" ]]; then
    echo "Not inside a git repository!"
    return 1
  else
    echo "Jump relative to git repository ($git_directory)"
    cd "$(zoxide query $git_directory $@)"
  fi
}

# Jump relative to the current working directory.
function zz() {
  cd "$(zoxide query $PWD/ $@)"
}
