export $(systemctl --user show-environment)

export HISTFILE=$XDG_DATA_HOME/zsh/command_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export DIRSTACKSIZE=20
export ZSH_COMPLETION_DUMP=$XDG_DATA_HOME/zsh/comp_dump_$ZSH_VERSION
