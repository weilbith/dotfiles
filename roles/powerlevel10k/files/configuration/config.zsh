# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration variables, to allow re-sourcing this file.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir
    context
    vcs
    newline
    prompt_char
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    virtualenv pyenv # Which one?
    nodenv nvm nodeenv # Which one?
    terraform
    aws
    ranger vim_shell # What is that?
  )

  # Basic Options
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=same-dir
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_SHOW_RULER=false

  # Seperators
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=""
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%15F"
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=""
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%15F"

  # Directory
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=254
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=24
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=…
  typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR="%B  %b"
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=248
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=15
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  local anchor_files=(
    .git
    .node-version
    .python-version
    .shorten_folder_marker
    .terraform
    Cargo.toml
    package.json
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=""
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=true
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v2
  typeset -g POWERLEVEL9K_LOCK_ICON=''
  typeset -g POWERLEVEL9K_DIR_ETC_NOT_WRITABLE_BACKGROUND=197
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_NOT_WRITABLE_BACKGROUND=197
  typeset -g POWERLEVEL9K_DIR_DEFAULT_NOT_WRITABLE_BACKGROUND=197

  # Context
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=15
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=32

  # VCS Status
  typeset -gA __p9k_vcs_states=(
    'CLEAN'         '81'
    'MODIFIED'      '3'
    'UNTRACKED'     '32'
    'LOADING'       '239'
    'CONFLICTED'    '197'
  )
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1


  # Vi Mode
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_FOREGROUND=15
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_BACKGROUND=24
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION=''

  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_FOREGROUND=239
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_BACKGROUND=291
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=''

  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_{VIVIS,VIOWR}_FOREGROUND=15
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_{VIINS,VIOWR}_BACKGROUND=191
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='VIVS'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='VIOWR'

  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''


  # Command Status
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false

  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=232
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=81
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='ﳣ '

  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=15
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=197
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION=''

  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=15
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=197
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='﬉'

  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=15
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=197
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='ﳤ '


  # Command Execution Time
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=15
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=197
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='ﲊ'


  # Background Jobs
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=15
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=197
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION=''


  # If p10k is already loaded, reload configuration.
  # This works even with POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
  (( ! $+functions[p10k] )) || p10k reload
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'