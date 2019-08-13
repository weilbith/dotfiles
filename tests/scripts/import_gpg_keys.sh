#!/bin/bash

KEY_FOLDER="$(dirname "${BASH_SOURCE[0]}")/../gpgkeys"

if ! command -v gpg >/dev/null; then
  echo "Can not export GuPG keys, since the command 'gpg' is not available!"
  return
fi

if [[ ! -d "$KEY_FOLDER" ]]; then
  echo "No key folder found."
  exit 0
fi

find "$KEY_FOLDER" -type f -name "*.gpg" \
  -exec gpg --batch --allow-secret-key-import --import {} \;
