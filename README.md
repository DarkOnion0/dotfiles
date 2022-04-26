# 🧰 DarkOnion0's dotfiles

My personal dotfiles for my **\*nix** system (currently [NixOS](https://nixos.org/))

## Usage

You can use the [`go cli`](./installer) to use my dotfiles but it's always in heavy development

## 📜 Directory index

```text
.
├── build.sh
├── dockerfile
├── dotfiles.yaml
├── .gitignore
├── go.mod
├── go.sum
├── home                                            # The directory where all my dotfiles lives
│   ├── .config
│   │   ├── alacritty                               # My terminal config
│   │   │   └── alacritty.yml
│   │   ├── fish                                    # My shell config
│   │   │   ├── conf.d
│   │   │   │   └── config.fish
│   │   │   └── config.fish
│   │   ├── i3                                      # My minimal VM config
│   │   │   ├── bin
│   │   │   │   ├── lock.bash
│   │   │   │   └── wallpaper.bash
│   │   │   └── config
│   │   ├── nixpkgs                                 # My home-manager config
│   │   │   └── home.nix
│   │   ├── nvim                                    # My text editor (neovim) config
│   │   │   ├── coc-settings.json
│   │   │   ├── init.lua
│   │   │   ├── init.vim
│   │   │   └── lua
│   │   │       ├── editorSettings.lua
│   │   │       ├── functions.lua
│   │   │       ├── plugins
│   │   │       │   ├── airline.lua
│   │   │       │   ├── ale.lua
│   │   │       │   ├── coc-explorer.lua
│   │   │       │   ├── coc-git.lua
│   │   │       │   ├── coc.lua
│   │   │       │   ├── context.lua
│   │   │       │   ├── deoplete.lua
│   │   │       │   ├── editorconfig.lua
│   │   │       │   ├── emmet.lua
│   │   │       │   ├── rainbow_parentheses.lua
│   │   │       │   ├── undotree.lua
│   │   │       │   ├── vim-go.lua
│   │   │       │   └── vimsence.lua
│   │   │       ├── plugins.lua
│   │   │       ├── shortcuts.lua
│   │   │       └── theme.lua
│   │   ├── polybar                                 # My bar config
│   │   │   ├── config
│   │   │   └── launch.sh
│   │   ├── rofi                                    # My launcher config
│   │   │   └── config.rasi
│   │   └── starship.toml
│   ├── .gitconfig
│   ├── nixos                                       # My OS config
│   │   ├── configuration.nix
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
│   └── .tmux.conf                                  # My minimal tmux config
├── installer                                       # My dotfiles installer code (deprecated ?!)
│   ├── cmd
│   │   ├── install.go
│   │   ├── root.go
│   │   └── upload.go
│   └── main.go
├── LICENSE
├── package.yaml
├── README.md
├── test.txt
└── updater.sh                                      # My minimal dotfiles sync script
```
