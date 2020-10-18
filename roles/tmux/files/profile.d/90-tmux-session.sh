#!/bin/bash

AVAILABLE_SESSION_NAMES=(Berlin Paris Amsterdam London Edinburgh Glasgow NewYork Washington)

function getSessionName() {
  local open_session_names
  open_session_names="$(tmux list-sessions 2>/dev/null)"

  for name in "${AVAILABLE_SESSION_NAMES[@]}"; do
    if ! grep --quiet "$name" <<<"$open_session_names"; then
      echo "$name"
      return
    fi
  done

  echo ""
}

function startSession() {
  local session_name="$1"
  local command="tmux new-session -t $TMUX_DEFAULT_GROUP_NAME"
  [[ -n "$session_name" ]] && command+=" -s $session_name"
  eval "$command"
}

function isInteractiveShell() {
  if [[ ! -o login ]] && [[ -z "$TMUX" ]]; then
    return 0
  else
    return 1
  fi
}

isInteractiveShell && startSession "$(getSessionName)"
