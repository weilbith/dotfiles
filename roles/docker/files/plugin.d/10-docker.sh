# Configuration fixes to make completions work after stack options like `-it`.
zinit wait lucid light-mode blockf \
  atinit"zstyle ':completion:*:*:docker:*' option-stacking yes" \
  atinit"zstyle ':completion:*:*:docker-*:*' option-stacking yes" \
  for OMZ::plugins/docker/_docker

zinit wait lucid light-mode blockf for \
  OMZ::plugins/docker-compose/_docker-compose
