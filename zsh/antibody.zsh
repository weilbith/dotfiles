# Exports
export PLUGIN_LIST_RAW=$CONFIG_DIR/plugin-list.txt # Used to generate the plugin list with Antibody.
export PLUGIN_LIST=$CONFIG_DIR/plugin-list.sh # The generated plugin list to source.

# Some variables required by Oh-My-Zsh
export ZSH=$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh
export ZSH_CACHE_DIR="$ZSH/cache"

# Load plugins
source $PLUGIN_LIST

# To Update the plugin list, call this in a shell and restart it afterwards.
# antibody bundle < $PLUGIN_LIST_RAW > $PLUGIN_LIST
