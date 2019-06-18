# Chain of fasd and fzf.
# The first argument defines what suggestions fasd should provide.
# The selected source changes the behavior of fzf.
#
# Arguments:
#   $1 - argument for fasd defining the source and for the related fzf command
#
fasd_fzf_helper() {
  local args=(${(z)LBUFFER})
  local cmd="${args[1]}"

  local query
  [[ ${#args} -gt 1 ]] && query="${args[-1]}"

  local matches=$(fasd $1 -l -R "$query")
  local count=$(echo $matches | wc -l)

  # Get the fzf variable with command configurations related to the fasd source
  eval "local fzf_ctrl_x_opts=\$FZF_CTRL_$([[ $1 = '-f' ]] && echo T || echo C)_OPTS"

  # Use fuzzy finding to filter multiple results.
  if [[ "$count" -gt 1 ]]; then
    local suggestions=$(echo $matches | \
        FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $fzf_ctrl_x_opts" \
        fzf --query="$query"
    )

  # Complete the single result.
  elif [[ "$count" -eq 1 ]]; then
    local suggestions=$matches

  # Nothing to complete
  else
    return
  fi

  # Insert selected result.
  LBUFFER="$cmd $suggestions"
  zle redisplay
}

# Filter fasd files with fzf.
fasd_fzf_file_selection() {
  fasd_fzf_helper '-f'
}

# Filter fasd directories with fzf.
fasd_fzf_directory_selection() {
  fasd_fzf_helper '-d'
}


# Broot function for external commands
function br {
  tmp_file=$(mktemp)
  broot --outcmd "$tmp_file" "$@"
  cmd_content=$(cat "$tmp_file")
  rm -f "$tmp_file"
  eval "$cmd_content"
}


# Define widgets.
zle -N fasd_fzf_file_selection
zle -N fasd_fzf_directory_selection
