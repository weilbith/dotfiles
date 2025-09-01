setopt interactivecomments
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
bindkey '^I' menu-select # Tab
bindkey -M menuselect '^I' menu-complete # Tab
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete # Shift-Tab
bindkey -M menuselect '^M' .accept-line # Return

source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
bindkey '^[\t' autosuggest-accept # Alt-Tab
