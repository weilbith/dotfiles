# shellcheck disable=SC2034

zplug "zsh-users/zsh-syntax-highlighting"

typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[builtin]='fg=191'
ZSH_HIGHLIGHT_STYLES[alias]='fg=191'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=191'
ZSH_HIGHLIGHT_STYLES[function]='fg=191'
ZSH_HIGHLIGHT_STYLES[command]='fg=191'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=191'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=191'
