# shellcheck disable=SC1090,SC1091

source /usr/share/zsh/scripts/zplug/init.zsh

set -a
for file in "$ZPLUG_CONFIG_DIR"/*; do source "$file"; done
set +a

zplug load
