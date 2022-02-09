#!/bin/bash

git status

cp ~/.config/i3/config ~/Programmation/git/dotfiles/home/.config/i3/
cp ~/.config/fish/config.fish ~/Programmation/git/dotfiles/home/.config/fish/
#cp ~/.config/rofi/* ~/Programmation/git/dotfiles/.config/rofi/
#cp ~/.config/polybar/* ~/Programmation/git/dotfiles/.config/polybar/
cp ~/.config/starship.toml ~/Programmation/git/dotfiles/home/.config/
cp ~/.config/alacritty/alacritty.yml ~/Programmation/git/dotfiles/home/.config/alacritty/
cp ~/.tmux.conf ~/Programmation/git/dotfiles/home/
cp ~/.gitconfig ~/Programmation/git/dotfiles/home/
sudo cp -r /etc/nixos/* ~/Programmation/git/dotfiles/home/nixos/

git status
