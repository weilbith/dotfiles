# Load profile script as shared by all tools (including plugins).
for file in $XDG_CONFIG_HOME/profile.d/*; do source $file; done

# Dir-stack
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

# History
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

# Auto-correction
setopt CORRECT
setopt CORRECT_ALL

# Jobs
setopt CHECK_JOBS
setopt CHECK_RUNNING_JOBS
setopt LONG_LIST_JOBS

# Misc
setopt AUTO_CD
setopt RM_STAR_SILENT
setopt NO_BEEP

# Vi-mode
setopt VI

bindkey -M viins '\e' vi-cmd-mode
bindkey -M viins '^?' vi-backward-delete-char
bindkey -M vicmd '^[[3~' delete-char

# Always be in normal/vicmd mode on new prompt.
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init
