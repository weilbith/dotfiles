zinit wait lucid light-mode \
  atinit"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'" \
  atinit"ZSH_AUTOSUGGEST_USE_ASYNC='true'" \
  atload"bindkey '^[\t' autosuggest-accept" \
  atload"bindkey '^[\r' autosuggest-execute" \
  atload"_zsh_autosuggest_start" \
  for zsh-users/zsh-autosuggestions
