# Awkward setup. Zinit does not do it automatically, so following the manual
# plugin documentation for the initial steps.
zinit wait lucid light-mode \
  atload"zinit add-fpath knu/zsh-manydots-magic" \
  atload"autoload -Uz manydots-magic" \
  atload"manydots-magic" \
  for knu/zsh-manydots-magic

