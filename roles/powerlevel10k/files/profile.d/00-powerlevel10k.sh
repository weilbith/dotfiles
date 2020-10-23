# shellcheck disable=1090,1091

# For the instant prompt this profile should be loaded at the very beginning.
# Therefore use the zero index of the profile script.

[[ -r $POWERLEVEL9K_CACHE_FILE ]] && source "$POWERLEVEL9K_CACHE_FILE"
source "$POWERLEVEL9K_CONFIG_FILE"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
