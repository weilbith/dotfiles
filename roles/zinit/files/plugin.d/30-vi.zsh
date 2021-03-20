zinit wait lucid light-mode for \
  zsh-vi-more/vi-motions \
  atinit"zstyle :zle:evil-registers ctrl-r true" \
  zsh-vi-more/evil-registers \
  atload"bindkey -M vicmd '  ' vi-easy-motion" \
  atinit"EASY_MOTION_DIM='fg=239'" \
  atinit"EASY_MOTION_HIGHLIGHT='fg=191,bold'" \
  atinit"EASY_MOTION_HIGHLIGHT_2_FIRST='fg=197,bold'" \
  atinit"EASY_MOTION_HIGHLIGHT_2_SECOND='fg=197,bold'" \
  IngoMeyer441/zsh-easy-motion

# Does not work?
#   atinit"zstyle 'zle:exchange' highlight 'fg=239,bg=291'" \
#   okapia/zsh-viexchange
