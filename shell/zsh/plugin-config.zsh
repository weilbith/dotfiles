# Oh-My-Zsh
DISABLE_AUTO_UPDATE=true # Antibody handle this.

# Zsh Autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=32'
bindkey '^[\r' autosuggest-execute # Alt + Return
bindkey '^[\t' autosuggest-accept # Alt + Tab

# Zsh Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[builtin]='fg=191'
ZSH_HIGHLIGHT_STYLES[alias]='fg=191'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=191'
ZSH_HIGHLIGHT_STYLES[function]='fg=191'
ZSH_HIGHLIGHT_STYLES[command]='fg=191'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=191'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=191'

# Fzf
## Options
FZF_DEFAULT_OPTS='
  --height 40%
  --color fg:38,hl:191,fg+:81,bg+:16,info:197,prompt:197,spinner:197,pointer:197,marker:191,header:15
  '
FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
FZF_CTRL_T_OPTS='
  --preview "head -50 {}"
  --bind "alt-e:execute(nvim {})+abort"
  '
FZF_COMPLETION_TRIGGER='**'

## Mappings
bindkey '^f' fzf-file-widget
bindkey '^d' fzf-cd-widget
bindkey '^h' fzf-history-widget

# Fasd
FASD_CACHE="${ZSH_CACHE_DIR}/fasd-init-cache"

if [ "$(command -v fasd)" -nt "$FASD_CACHE" -o ! -s "$FASD_CACHE" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$FASD_CACHE"
fi

source "$FASD_CACHE"
unset FASD_CACHE

bindkey '^[f' fasd_fzf_file_selection      # Alt + f
bindkey '^[d' fasd_fzf_directory_selection # Alt + d

# Exa
EXA_COLORS="di=38;5;24"

# Marker
## Locations
MARKER_HOME="$HOME/Tools/marker"
MARKER_DATA_HOME="$XDG_DATA_HOME/marker"

## Key Bindings
MARKER_KEY_GET='^[m'
MARKER_KEY_MARK=''
MARKER_KEY_NEXT_PLACEHOLDER='^ '
