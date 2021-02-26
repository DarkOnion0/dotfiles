# DarkOnion's dotfiles
My personal dotfiles for my *nix system (actually it's [ArchLinux](https://archlinux.org/))

# Shell 🐚

## Fish 🐠

* ArchLinux
```sh
pacman -S fish && chsh -s /usr/bin/fish $USER
```
* Ubuntu based distro
```sh
sudo apt install -y fish && chsh -s /usr/bin/fish $USER && curl -fsSL https://starship.rs/install.sh | bash && fish
```

## VSCodium 
VSCodium is only avaible in the AUR, so you should install an AUR helper like [yay](https://github.com/Jguer/yay) or [paru](https://github.com/Morganamilo/paru)
* ArchLinux
```sh
yay -S vscodium-bin
```
* Ubuntu based distro
```sh
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg 
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
sudo apt update && sudo apt install -y codium 
```
I packed my installed extension in a zip archive named `.vscode-oss.zip`