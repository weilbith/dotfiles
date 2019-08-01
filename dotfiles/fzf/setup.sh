# shellcheck disable=1090,1094,2034

# Setup
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Options
FZF_DEFAULT_OPTS='
  --height 40%
  --color fg:38,hl:191,fg+:81,bg+:16,info:197,prompt:197,spinner:197,pointer:197,marker:191,header:15
  '
FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
FZF_CTRL_T_OPTS='
  --preview "head -50 {}"
  --bind "alt-e:execute(nvim {})+abort"
  '
FZF_COMPLETION_TRIGGER='**'

# Mappings
bindkey '^f' fzf-file-widget
bindkey '^d' fzf-cd-widget
bindkey '^h' fzf-history-widget
