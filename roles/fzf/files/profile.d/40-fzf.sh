# shellcheck disable=1094,2034

# This profile should be loaded before the profile loading all the Zsh plugins.
# Some plugins depend on fzf or adopt their behavior if it is available.

# Leave the variables here instead of putting them into environment.d, since
# systemd is environment-generator can't handle the whitespace characters well.
# Decoding it in a not readable manner to make it working is not worth the
# trouble.
function shell_runs_in_tmux_session() { test -n "$TMUX"; }

FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --preview 'bat --color=always {} 2> /dev/null'"
FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --bind 'ctrl-d:reload(fd . --type=directory),ctrl-f:reload(fd . --type=file)'"
FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color fg:38,hl:191,fg+:81,bg+:16,info:197,prompt:197,spinner:197,pointer:197,marker:191,header:15"
shell_runs_in_tmux_session && FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --tmux center"

source /usr/share/fzf/completion.zsh
