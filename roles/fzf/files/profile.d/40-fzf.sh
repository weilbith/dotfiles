# shellcheck disable=1094,2034

# This profile should be loaded before the profile loading all the Zsh plugins.
# Some plugins depend on fzf or adopt their behavior if it is available.

# Leave the variables here instead of putting them into environment.d, since
# systemd is environment-generator can't handle the whitespace characters well.
# Decoding it in a not readable manner to make it working is not worth the
# trouble.
FZF_DEFAULT_OPTS='--height 40% --color fg:38,hl:191,fg+:81,bg+:16,info:197,prompt:197,spinner:197,pointer:197,marker:191,header:15'

FZF_COMPLETION_TRIGGER='**'
FZF_COMPLETION_OPTS='--preview "bat --color=always --line-range :50 {} 2> /dev/null || head -50 {}"'

FZF_TMUX=1
FZF_TMUX_OPTS='-p -w70% -h50% -xC -yC'

source /usr/share/fzf/completion.zsh
