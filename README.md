# 🧰 DarkOnion0's dotfiles

My personal dotfiles for my **\*nix** system (currently [NixOS](https://nixos.org/))

## Usage

You can use the [`go cli`](./installer) to use my dotfiles but it's always in heavy development

## 📜 Directory index

```text
.
├── build.sh                            # the build script for the cli
├── dockerfile                          # the docker test images (DEPRECATED)
├── dotfiles.yaml                       # my dotfiles config file
├── go.mod
├── go.sum
├── home                                # the directory where all my dotfiles lives
│   ├── .config                         # my nix config files
│   │   ├── alacritty
│   │   │   └── alacritty.yml
│   │   ├── fish
│   │   │   └── config.fish
│   │   ├── i3
│   │   │   └── config
│   │   ├── nvim
│   │   │   └── init.vim
│   │   ├── polybar
│   │   │   ├── config
│   │   │   └── launch.sh
│   │   ├── rofi
│   │   │   └── config.rasi
│   │   └── starship.toml
│   ├── nixos                           # my nixos config files
│   │   ├── configuration.nix
│   │   ├── configuration.nix.backup
│   │   ├── hardware-configuration.nix
│   │   ├── network
│   │   │   ├── bluetooth.nix
│   │   │   ├── default.nix
│   │   │   └── ethernet.nix
│   │   ├── packages.nix
│   │   ├── system
│   │   │   ├── boot.nix
│   │   │   ├── default.nix
│   │   │   ├── services.nix
│   │   │   └── x11.nix
│   │   └── user.nix
│   └── .tmux.conf
├── installer                           # the cli directory
│   ├── cmd
│   │   ├── install.go
│   │   ├── root.go
│   │   └── upload.go
│   └── main.go
├── LICENSE
├── package.yaml                        # my cli packages list
├── README.md                           # this file :)
└── updater.sh                          # the update script (DEPRECATED)
```
