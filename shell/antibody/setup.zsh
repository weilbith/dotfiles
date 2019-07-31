ANTIBODY_CONFIG_HOME="$XDG_CONFIG_HOME/antibody"
PLUGIN_LIST_SOURCE="$ANTIBODY_CONFIG_HOME/plugin-list.txt"
PLUGIN_LIST_DESTINATION="$(antibody home)/plugin-list.zsh"
PLUGIN_CONFIGURATION="$ANTIBODY_CONFIG_HOME/plugin-configuration.zsh"

# Note:
# This does not register updates to the source list.
# Therefore the below command must be executed manually.
if [[ ! -f "$PLUGIN_LIST_DESTINATION" ]]; then
  echo "Start to bundle plugins with Antigen..."
  antibody bundle < "$PLUGIN_LIST_SOURCE" > "$PLUGIN_LIST_DESTINATION"
fi

# Some variables required by Oh-My-Zsh
export ZSH=$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh
export ZSH_CACHE_DIR="$ZSH/cache"

# Load plugins and their configuration
source "$PLUGIN_LIST_DESTINATION"
source "$PLUGIN_CONFIGURATION"
