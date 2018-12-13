#!/bin/bash

# Use lists for packages to install them at once at the end.
PACMAN_LIST=""
TRIZEN_LIST=""
YARN_LIST=""
PIP_LIST=""

# Utility function easily extend a specific list by a package.
#
# Arguments:
#   $1 - list name (must exist)
#   $2 - package name to add
#
function addPackage {
  case "$1" in
    pacman )
      PACMAN_LIST="$PACMAN_LIST  $2"
      ;;

    trizen )
      TRIZEN_LIST="$TRIZEN_LIST  $2"
      ;;

    yarn )
      YARN_LIST="$YARN_LIST $2"
      ;;

    pip )
      PIP_LIST="$PIP_LIST $2"
      ;;

    * )
      echo "Unknown list ($1) for package $2!"
  esac
}


# NodeJS
addPackage pacman nodejs
addPackage pacman yarn

# Linter/Formatter
## Uncrustify
addPackage pacman uncrustify

## Solium
addPackage yarn solium

## FixJSON
addPackage yarn fixjson

## ESLint
addPackage yarn eslint
addPackage yarn babel-eslint
addPackage yarn eslint-plugin-import
addPackage yarn eslint-plugin-promise
addPackage yarn eslint-plugin-react

## TSLint
addPackage yarn tslint
addPackage yarn tslint-config-standard
addPackage yarn tslint-config-standard

## Prettier
addPackage pacman prettier
addPackage yarn prettier
addPackage yarn eslint-plugin-prettier
addPackage yarn eslint-config-prettier
addPackage yarn tslint-config-prettier

## Tern
addPackage yarn tern


# Install package lists.
echo "Pacman:  $PACMAN_LIST"
sudo pacman -Sy --noconfirm $PACMAN_LIST

echo "Trizen:  $TRIZEN_LIST"
trizen -S $TRIZEN_LIST

echo "Yarn:  $YARN_LIST"
sudo yarn global add $YARN_LIST

echo "Pip:  $PIP_LIST"
sudo pip install $PIP_LIST


# Linking
ln -sf $(pwd)/soliumrc.json ~/.soliumrc.json
ln -sf $(pwd)/eslintrc ~/.eslintrc
ln -sf $(pwd)/tslint.json ~/.tslint.json
ln -sf $(pwd)/prettierrc.json ~/.prettierrc.json
ln -sf $(pwd)/yarn $XDG_CONFIG_HOME/
ln -sf $(pwd)/npm $XDG_CONFIG_HOME/
