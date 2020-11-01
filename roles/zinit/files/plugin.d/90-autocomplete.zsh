# Can't use `wait` mode, else hooks get not registered for the first prompt.
zinit lucid light-mode \
  atinit"zstyle ':completion:*' extra-verbose yes" \
  atinit"zstyle ':autocomplete:*' groups 'always'" \
  atinit"zstyle ':autocomplete:*' max-lines 30" \
  atinit"zstyle ':autocomplete:tab:*' widget-style menu-select" \
  atinit"zstyle ':autocomplete:tab:*' fzf-completion yes" \
  for marlonrichert/zsh-autocomplete
