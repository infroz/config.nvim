#!/bin/bash

PIPE="/tmp/godot.pipe"
FILE="$1"

# If Neovim isn't running, start it in a terminal
if [ ! -e "$PIPE" ]; then
  gnome-terminal -- nvim --listen "$PIPE"
  sleep 0.5
fi

# Send the file to the running Neovim instance
nvim --server "$PIPE" --remote "$FILE"
