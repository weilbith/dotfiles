# shellcheck disable=SC2034

zplug "zsh-users/zsh-autosuggestions"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
ZSH_AUTOSUGGEST_USE_ASYNC='true'

bindkey '^[\r' autosuggest-execute # Alt + Return
bindkey '^[\t' autosuggest-accept  # Alt + Tab
