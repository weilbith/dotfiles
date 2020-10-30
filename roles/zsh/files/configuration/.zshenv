export $(systemctl --user show-environment)

# Dir-stack
export DIRSTACKSIZE=20

# History
export HISTFILE=$XDG_DATA_HOME/zsh/command_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# Vi-mode
export KEYTIMEOUT=20

# Misc
export ZSH_COMPLETION_DUMP=$XDG_DATA_HOME/zsh/comp_dump_$ZSH_VERSION
