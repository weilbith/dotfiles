#!/bin/bash

set -e

DOTFILE_DIRECTORY=$HOME/dotfiles

function updateSystemOnNewMachine() {
  local remember_update_file=/var/inital_update_done

  if [[ ! -f "$remember_update_file" ]]; then
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
    sudo pacman --sync --refresh --sysupgrade --noconfirm
    sudo pacman --sync --clean --clean
    sudo touch "$remember_update_file"
  fi
}

function syncDataToHomeDirectory() {
  rm -rf "$DOTFILE_DIRECTORY"
  cp -rf /vagrant "$DOTFILE_DIRECTORY"
}

function installDependencies() {
  sudo pacman --sync --needed --noconfirm --quiet base-devel git 2>/dev/null
  cd "$DOTFILE_DIRECTORY"
  make install-provision
}

function runProvision() {
  if [[ -n "$ROLE" ]]; then
    make provide-role ROLE="$ROLE"
  elif [[ -n "$BOOK" ]]; then
    make provide-book BOOK="$BOOK"
  else
    make provide
  fi
}

updateSystemOnNewMachine
syncDataToHomeDirectory
installDependencies
runProvision
