autoload -Uz compinit
compinit -d $ZSH_COMPLETION_DUMP

# Load profile script as shared by all tools (including plugins).
for file in $XDG_CONFIG_HOME/profile.d/*; do source $file; done

# Vi-mode
bindkey -v
bindkey '\e' vi-cmd-mode # Fix escape insert mode issues
bindkey '^?' backward-delete-char # Allow backspace in insert mode
setopt vi
set KEYTIMEOUT=1
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init

# Dir-stack
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS

# History
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

# Auto-correction
setopt CORRECT
setopt CORRECT_ALL

# Misc
setopt AUTO_CD
