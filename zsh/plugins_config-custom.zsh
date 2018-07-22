# Oh-My-Zsh
DISABLE_AUTO_UPDATE=true # Antibody handle this.

# Zsh Autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=32'
bindkey '^[\r' autosuggest-execute # Alt + Return
bindkey '^[\t' autosuggest-accept # Alt + Tab

# Zsh Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[builtin]='fg=191'
ZSH_HIGHLIGHT_STYLES[alias]='fg=191'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=191'
ZSH_HIGHLIGHT_STYLES[function]='fg=191'
ZSH_HIGHLIGHT_STYLES[command]='fg=191'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=191'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=191'

# TMux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true
