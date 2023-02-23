#!/bin/bash

git status

# VM
cp -r ~/.config/i3/* ~/Programmation/git/dotfiles/home/.config/i3/
cp -r ~/.config/rofi/* ~/Programmation/git/dotfiles/home/.config/rofi/
cp -r ~/.config/greenclip.toml ~/Programmation/git/dotfiles/home/.config/
#cp ~/.config/polybar/* ~/Programmation/git/dotfiles/.config/polybar/

# SHELL
cp ~/.config/fish/config.fish ~/Programmation/git/dotfiles/home/.config/fish/
cp -r ~/.config/fish/functions/ ~/Programmation/git/dotfiles/home/.config/fish/
cp ~/.config/fish/conf.d/config.fish ~/Programmation/git/dotfiles/home/.config/fish/conf.d/config.fish
cp ~/.config/starship.toml ~/Programmation/git/dotfiles/home/.config/
cp ~/.config/alacritty/alacritty.yml ~/Programmation/git/dotfiles/home/.config/alacritty/
cp -r ~/.config/kitty/ ~/Programmation/git/dotfiles/home/.config/
cp ~/.tmux.conf ~/Programmation/git/dotfiles/home/

# GIT
cp ~/.gitconfig ~/Programmation/git/dotfiles/home/

# Neovim
cp ~/.config/nvim/init.vim ~/Programmation/git/dotfiles/home/.config/nvim/init.vim
cp ~/.config/nvim/init.lua ~/Programmation/git/dotfiles/home/.config/nvim/init.lua
cp -r ~/.config/nvim/lua ~/Programmation/git/dotfiles/home/.config/nvim/
cp ~/.config/nvim/coc-settings.json ~/Programmation/git/dotfiles/home/.config/nvim/coc-settings.json

# Nix
sudo cp -r /etc/nixos/* ~/Programmation/git/dotfiles/home/nixos/
cp -r ~/.config/nixpkgs/ ~/Programmation/git/dotfiles/home/.config/ # home-manager

git status
