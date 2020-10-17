# shellcheck disable=SC1091

source /usr/share/LS_COLORS/dircolors.sh

alias ls="exa"
alias ll="exa --long --classify --links --header --git --sort=date --group-directories-first --time-style=long-iso"
alias la="ll --all"
alias lt="exa --tree --level=2"
