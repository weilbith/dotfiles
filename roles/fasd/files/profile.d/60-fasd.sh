# shellcheck disable=1090

# This profile should be loaded after the profile loading the auto-completion
# plugin. Else the auto-completion for fasd will not work.

if [[ "$(command -v fasd)" -nt "$FASD_CACHE_FILE" ]] || [[ ! -s "$FASD_CACHE_FILE" ]]; then
  # Do not enable completion hooks, since this is handled by the auto-completion
  # plugin and could lead to incompatibilities.
  fasd --init zsh-hook >|"$FASD_CACHE_FILE"
fi

source "$FASD_CACHE_FILE"
