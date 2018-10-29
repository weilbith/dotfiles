#!/bin/bash

XRESOURCES=$HOME/.Xresources
XMODMAP=$HOME/.Xmodmap

[[ -f "$XRESOURCES" ]] && xrdb -merge $XRESOURCES
[[ -f "$XMODMAP" ]] && xmodmap $XMODMAP

exec i3
