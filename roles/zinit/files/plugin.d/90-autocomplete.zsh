# Can't use `wait` mode, else hooks get not registered for the first prompt.
zinit lucid light-mode \
  atinit"zstyle ':autocomplete:*' groups 'always'" \
  atinit"zstyle ':autocomplete:tab:*' widget-style menu-select" \
  atinit"zstyle ':autocomplete:tab:*' fzf-completion no" \
  atinit"zstyle ':autocomplete:tab:*' accept-autosuggestions no" \
  for marlonrichert/zsh-autocomplete
