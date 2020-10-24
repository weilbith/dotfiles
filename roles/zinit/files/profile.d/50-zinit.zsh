# shellcheck disable=1090,1091,2034,2154

# Leave the variables here instead of putting them into environment.d, since
# systemd is environment-generator can't handle arrays.
declare -A ZINIT
ZINIT[HOME_DIR]="$XDG_CACHE_HOME/zinit"
ZINIT[BIN_DIR]="$XDG_CACHE_HOME/zinit/bin"
ZINIT[PLUGINS_DIR]="$XDG_CACHE_HOME/zinit/plugins"
ZINIT[COMPLETIONS_DIR]="$XDG_CACHE_HOME/zinit/completions"
ZINIT[SNIPPETS_DIR]="$XDG_CACHE_HOME/zinit/snippets"
ZINIT[ZCOMPDUMP_PATH]="$ZSH_COMPLETION_DUMP"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]=1

source /usr/share/zsh/scripts/zinit/zinit.zsh

# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

set -a
for file in "$ZSH_PLUGIN_LIST_DIR"/*.zsh; do source "$file"; done
set +a
