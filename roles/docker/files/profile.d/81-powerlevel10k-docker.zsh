function prompt_my_docker() {
  local username="$(docker info 2>/dev/null | sed '/Username:/!d;s/.* //')"

  if [[ -n "$username" ]]; then
    text=$username
    state=ONLINE
  else
    text=offline
    state=OFFLINE
  fi

  p10k segment +e -t $text -s $state
}

POWERLEVEL9K_MY_DOCKER_ONLINE_FOREGROUND=15
POWERLEVEL9K_MY_DOCKER_ONLINE_BACKGROUND=32

POWERLEVEL9K_MY_DOCKER_OFFLINE_FOREGROUND=15
POWERLEVEL9K_MY_DOCKER_OFFLINE_BACKGROUND=197

POWERLEVEL9K_MY_DOCKER_VISUAL_IDENTIFIER_EXPANSION=""
POWERLEVEL9K_MY_DOCKER_SHOW_ON_COMMAND=docker

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=my_docker
