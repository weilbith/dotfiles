SSH_AGENT_CACHE="$XDG_CACHE_HOME/ssh/cache"

# Check if agent is running.
if ! pgrep -u "$USER" ssh-agent >/dev/null; then
  # Start and cache variables for next shell.
  ssh-agent >"$SSH_AGENT_CACHE"
fi

# Check if the variables are exported already.
if [[ "$SSH_AGENT_PID" == "" ]]; then
  # Load variables from cache.
  eval "$(<"$SSH_AGENT_CACHE")"
fi
