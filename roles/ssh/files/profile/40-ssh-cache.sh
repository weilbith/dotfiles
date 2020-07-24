# Start agent if not already running and update cache.
if ! pgrep -u "$USER" ssh-agent >/dev/null; then
  ssh-agent >"$SSH_AGENT_CACHE_FILE"

# Load agents cache if not already present.
elif [[ -z "$SSH_AGENT_PID" ]]; then
  eval "$(<"$SSH_AGENT_CACHE_FILE")" >/dev/null
fi
