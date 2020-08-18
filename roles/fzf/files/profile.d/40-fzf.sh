# shellcheck disable=1094,2034

# This profile should be loaded before the profile loading all the Zsh plugins.
# Some plugins depend on fzf or adopt their behavior if it is available.

# Leave the variables here instead of putting them into environment.d, since
# systemd is environment-generator can't handle the whitespace characters well.
# Decoding it in a not readable manner to make it working is not worth the
# trouble.
FZF_DEFAULT_OPTS='--height 40% --color fg:38,hl:191,fg+:81,bg+:16,info:197,prompt:197,spinner:197,pointer:197,marker:191,header:15'
FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow 2> /dev/null'
FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
FZF_CTRL_T_OPTS='--preview "head -50 {}" --bind "alt-e:execute(nvim {})+abort"'
FZF_COMPLETION_TRIGGER='**'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey '^f' fzf-file-widget
bindkey '^d' fzf-cd-widget
bindkey '^h' fzf-history-widget
