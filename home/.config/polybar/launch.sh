#!/usr/bin/env bash

# Terminate already running bar instances
killall -q .polybar-wrappe
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

polybar i3-polybar --config=$HOME/Programmation/git/dotfiles/home/.config/polybar/config 
