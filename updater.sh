#!/bin/bash

git status

# VM
cp ~/.config/i3/config ~/Programmation/git/dotfiles/home/.config/i3/
#cp ~/.config/rofi/* ~/Programmation/git/dotfiles/.config/rofi/
#cp ~/.config/polybar/* ~/Programmation/git/dotfiles/.config/polybar/

# SHELL
cp ~/.config/fish/config.fish ~/Programmation/git/dotfiles/home/.config/fish/
cp ~/.config/starship.toml ~/Programmation/git/dotfiles/home/.config/
cp ~/.config/alacritty/alacritty.yml ~/Programmation/git/dotfiles/home/.config/alacritty/
cp ~/.tmux.conf ~/Programmation/git/dotfiles/home/

# GIT
cp ~/.gitconfig ~/Programmation/git/dotfiles/home/

# Neovim
cp ~/.config/nvim/init.vim ~/Programmation/git/dotfiles/home/.config/nvim/init.vim
cp ~/.config/nvim/init.lua ~/Programmation/git/dotfiles/home/.config/nvim/init.lua
cp -r ~/.config/nvim/lua ~/Programmation/git/dotfiles/home/.config/nvim/
cp ~/.config/nvim/coc-settings.json ~/Programmation/git/dotfiles/home/.config/nvim/coc-settings.json

# OS
sudo cp -r /etc/nixos/* ~/Programmation/git/dotfiles/home/nixos/

git status
