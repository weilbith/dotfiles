#!/bin/bash

KEY_FOLDER="$(dirname "${BASH_SOURCE[0]}")/../gpgkeys"
KEY_LIST=('D53C38FA78DFF2B4279F91B052FCDAA1483DA28D')

if ! command -v gpg >/dev/null; then
  echo "Can not export GuPG keys, since the command 'gpg' is not available!"
  return
fi

mkdir -p "$KEY_FOLDER"

for key in "${KEY_LIST[@]}"; do
  echo "Export GPG key '$key' ..."
  gpg --output "$KEY_FOLDER/${key}_pub.gpg" --armor --export "$key"
  gpg --output "$KEY_FOLDER/${key}_sec.gpg" --armor --export-secret-key "$key"
done
