zplug "marlonrichert/zsh-autocomplete"

zstyle ':autocomplete:*' groups 'always'
zstyle ':autocomplete:(slash|space):*' magic 'off'
zstyle ':autocomplete:tab:*' completion 'cycle' fzf
