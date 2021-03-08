#!/bin/bash

git status

cp ~/.config/i3/config ~/Programmation/git/dotfiles/.config/i3/
cp ~/.config/fish/* ~/Programmation/git/dotfiles/.config/fish/
cp ~/.config/rofi/* ~/Programmation/git/dotfiles/.config/rofi/
cp ~/.config/polybar/* ~/Programmation/git/dotfiles/.config/polybar/

git status
