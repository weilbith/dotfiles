# Oh-My-Zsh
DISABLE_AUTO_UPDATE=true # Antibody handle this.

# Zsh Autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
ZSH_AUTOSUGGEST_USE_ASYNC='true'
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

# Zsh Autocompletion
zstyle ':completion:correct-word:*' max-errors 0
zstyle ':autocomplete:*' groups 'always'
zstyle ':autocomplete:(slash|space):*' magic 'off'
zstyle ':autocomplete:tab:*' completion 'cycle'
zstyle ':autocomplete:tab:*' completion 'select'

# Powerlevel
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_INSTANT_PROMPT='quiet'

## Use the improved gitstatus tool for the VCS segement.
POWERLEVEL9K_VCS_STATUS_COMMAND=gitstatus_query_dir

## The Segements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon custom_user custom_host dir custom_writable newline vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv node_version status command_execution_time aws custom_dockerhub)

## Custom Segments
### User
powerlevel9k_custom_user() {
  local user="%n"
  echo "\uf2bd $user"
}

POWERLEVEL9K_CUSTOM_USER="powerlevel9k_custom_user"
POWERLEVEL9K_CUSTOM_USER_BACKGROUND="32"
POWERLEVEL9K_CUSTOM_USER_FOREGROUND="15"


### Host
powerlevel9k_custom_host() {
  local host="%m"
  echo "\uf108 $host"
}

POWERLEVEL9K_CUSTOM_HOST="powerlevel9k_custom_host"
POWERLEVEL9K_CUSTOM_HOST_BACKGROUND="81"
POWERLEVEL9K_CUSTOM_HOST_FOREGROUND="239"


### Writable
powerlevel9k_custom_writable() {
  if [[ ! -w "$PWD" ]]; then
  echo "\uf0c1"
  fi
}

POWERLEVEL9K_CUSTOM_WRITABLE="powerlevel9k_custom_writable"
POWERLEVEL9K_CUSTOM_WRITABLE_BACKGROUND="9"
POWERLEVEL9K_CUSTOM_WRITABLE_FOREGROUND="15"

## ---


### DockerHub
powerlevel9k_custom_dockerhub() {
  command -v docker>/dev/null && name="$(docker info | sed '/Username:/!d;s/.* //')"
  [[ -z "$name" ]] && name="offline"
  echo "\uf308 $name"
}

POWERLEVEL9K_CUSTOM_DOCKERHUB="powerlevel9k_custom_dockerhub"
POWERLEVEL9K_CUSTOM_DOCKERHUB_BACKGROUND="24"
POWERLEVEL9K_CUSTOM_DOCKERHUB_FOREGROUND="15"

## ---


## Standard Segments
### OS
POWERLEVEL9K_OS_ICON_BACKGROUND="24"
POWERLEVEL9K_OS_ICON_FOREGROUND="15"

### VI Mode Segment
POWERLEVEL9K_VI_INSERT_MODE_STRING="🅘"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="🅝"

POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="191"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="239"

POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="24"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="15"

### ---


### Dir Segment
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DELIMITER=".."

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="239"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="15"

POWERLEVEL9K_DIR_HOME_BACKGROUND="239"
POWERLEVEL9K_DIR_HOME_FOREGROUND="15"

POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="239"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="15"

POWERLEVEL9K_HOME_ICON="\uf07b"
POWERLEVEL9K_DIR_PATH_SEPARATOR_ICON="\uE0BB"
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon 'DIR_PATH_SEPARATOR_ICON') "
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=""

### ---


### Command Execution Time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="81"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="239"

### AWS
AWS_DEFAULT_PROFILE="tw_edu"
POWERLEVEL9K_AWS_BACKGROUND="32"
POWERLEVEL9K_AWS_FOREGROUND="15"

### Node Version
POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
