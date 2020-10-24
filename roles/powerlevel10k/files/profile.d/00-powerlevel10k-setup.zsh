# shellcheck disable=1090,1091

# For the instant prompt this profile should be loaded at the very beginning.
# Therefore use the zero index of the profile script.

[[ -r $POWERLEVEL9K_CACHE_FILE ]] && source "$POWERLEVEL9K_CACHE_FILE"
source "$POWERLEVEL9K_CONFIG_FILE"

# Do not source p10k itself in this script, but pretty late in the profile list.
# This allows other roles to extend the segment lists.
