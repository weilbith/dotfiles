# shellcheck disable=2116

# Start TMux on startup if it is available (mention the possible alias).
if [[ -n "$(echo tmux)" ]] || command -v tmux >/dev/null; then
  # List of default TMux session names.
  SESSION_NAMES=(Berlin Amsterdam London Paris Rom Florence Edinburgh)

  # Wrapper function to start TMux.
  # As additional feature it defines the session name.
  # By using a configured set of default session names,
  # it takes the next name that isn't already in use.
  # If all session names are taken, the default TMux session name is used.
  #
  function startTmux() {
    # Get the current list of sessions with their names.
    sessionList=$(tmux list-sessions 2>/dev/null)

    # Make sure any session is available.
    if [[ -n "$sessionList" ]]; then
      # Search for unused session name.
      # Start with index 1, cause the first is used in the else case.
      for ((i = 2; i <= ${#SESSION_NAMES[@]}; i++)); do
        current_name=${SESSION_NAMES[i]}
        used=$(echo "$sessionList" | grep "$current_name")

        if [[ -z "$used" ]]; then
          name="$current_name"
          break
        fi
      done

    # First session so take he first name.
    else
      name=${SESSION_NAMES[1]}
    fi

    # Start TMux with session name or not.
    if [[ -n "$name" ]]; then
      exec tmux new-session -s "$name"

    else
      exec tmux
    fi
  }

  # Do not start TMux on login shell.
  # Make sure to do not nest TMux sessions.
  [[ ! -o login ]] && [ -z "$TMUX" ] && startTmux
fi
