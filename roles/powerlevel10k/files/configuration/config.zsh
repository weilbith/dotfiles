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
    background_jobs
  )

  # Basic Options
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_SHOW_RULER=false

  # Seperators
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=""
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%15F"
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=""
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%15F"

  # Directory
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=15
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=237
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=…
  typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR="%B  %b"
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=252
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
  typeset -g POWERLEVEL9K_DIR_ETC_NOT_WRITABLE_BACKGROUND=196
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_NOT_WRITABLE_BACKGROUND=196
  typeset -g POWERLEVEL9K_DIR_DEFAULT_NOT_WRITABLE_BACKGROUND=196

  # Context
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=15
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=246
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

  # VCS Status
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=248
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=33
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=33
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=237
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=196

  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1


  # Vi Mode
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_FOREGROUND=15
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_BACKGROUND=237
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION=''

  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_FOREGROUND=16
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_BACKGROUND=33
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=''

  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_FOREGROUND=16
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_BACKGROUND=33
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION=''

  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_FOREGROUND=16
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_BACKGROUND=33
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION=''

  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''


  # Command Status
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false

  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=15
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=33
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='ﳣ '

  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=15
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=196
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION=''

  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=15
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=196
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='﬉'

  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=15
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=196
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='ﳤ '


  # Background Jobs
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=15
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=196
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION=''


  # Transient Prompt
  # Do not use default transient feature to allow customizing how the prompt
  # looks like in the history of the shell.
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

  function p10k-on-pre-prompt() {
    p10k display 'empty_line|1'=show
  }

  function p10k-on-post-prompt() {
    if [[ $PWD == ${my_last_dir-} ]]; then
      p10k display 'empty_line|1'=hide
    fi
    typeset -g my_last_dir=$PWD
  }

  # If p10k is already loaded, reload configuration.
  (( ! $+functions[p10k] )) || p10k reload
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
