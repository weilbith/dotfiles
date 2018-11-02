#!/bin/bash
#
# Script to install or update a bunch of WeeChat script.
# The scripts are defined in a list by their type and an URL where to download.
# Each script will be downloaded into its respective folder
# and a soft link gets created to automatically load this script on WeeChat start.

# Configuration
BASE_FOLDER="~/.weechat"
SCRIPT_LIST=(
  "python https://raw.githubusercontent.com/s3rvac/weechat-notify-send/master/notify_send.py"
  "python https://weechat.org/files/scripts/autosort.py"
  "python https://weechat.org/files/scripts/buffer_autoset.py"
  "python https://weechat.org/files/scripts/grep.py"
  "python https://weechat.org/files/scripts/text_item.py"
  "perl https://weechat.org/files/scripts/iset.pl"
  "perl https://weechat.org/files/scripts/perlexec.pl"
)

# Check if base folder exists and create it if not so.
if [[ ! -d "$BASE_FOLDER" ]] ; then
  mkdir -p $BASE_FOLDER
fi

# Do this for all scripts in the list.
for (( i=0; i<${#SCRIPT_LIST[@]}; i++ )); do
  script=${SCRIPT_LIST[i]} # Get the current script entry from the list.
  IFS=' ' read -a param <<< "$script" # Split the script entry into its describing parameters.
  type=${param[0]} # Get the parameter type (e.g. python, perl, ...)
  url=${param[1]} # Get parameter URL where to download the script.
  name=${url##*/} # Use the last part of the URL as name of the script.

  echo "Install script: ${name}" # Just as quick information for the user.

  # Define the folder where to place the script and autoload links,
  # by its type and create this if it does not exists so far.
  folder_script="${BASE_FOLDER}/${type}"
  folder_autoload="${folder_script}/autoload"

  [[ ! -d "$folder_script" ]] && mkdir -p $folder_script
  [[ ! -d "$folder_autoload" ]] && mkdir -p $folder_autoload

  # Download the script into that folder.
  path="${folder_script}/${name}"
  curl $url > $path

  # Create a symbolic link to autoload that script.
  link_name="${folder_autoload}/${name}"
  ln -sf $path $link_name
done

