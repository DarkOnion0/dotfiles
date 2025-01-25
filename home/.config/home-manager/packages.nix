{
  pkgs,
  unstable,
  ...
}: {
  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable Elkowars Wacky Widgets
  #programs.eww = {
  #  enable = true;
  #  package = pkgs.eww-wayland;
  #  configDir = "${config.home.homeDirectory}/Programmation/git/dotfiles/home/.config/eww/";
  #};

  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    # Sway
    #swaylock-effects
    #swayidle
    wl-clipboard
    #ulauncher

    # CLI
    curl
    killall
    wget
    yt-dlp
    vdhcoapp
    inxi
    btop
    nvtopPackages.amd
    powertop
    zip
    unzip
    bat
    tree
    #viddy
    p7zip
    ripgrep # needed for telescope.nvim
    ranger
    dua
    difftastic
    powertop
    eza

    # Backup tool
    restic
    syncthing
    gparted

    # Shell and prompt
    fish
    starship
    powerline
    fzf
    zoxide

    # Terminal app
    kitty
    pixcat
    #alacritty
    tmux

    # WebBrowser
    firefox
    brave
    librewolf
    tor-browser-bundle-bin
    #unstable.vivaldi
    #unstable.vivaldi-ffmpeg-codecs
    #unstable.widevine-cdm

    # KDE plasma
    #latte-dock
    #libsForQt5.qtstyleplugin-kvantum
    #libsForQt5.ark
    #libsForQt5.kcalc
    #libsForQt5.filelight
    #libsForQt5.qt5.qttools
    #libsForQt5.akonadi
    #libsForQt5.okular
    #libsForQt5.gwenview
    #libsForQt5.karchive
    #libsForQt5.krunner
    #libsForQt5.kcolorpicker
    #libsForQt5.kcolorchooser
    #libsForQt5.kwallet
    #libsForQt5.kwallet-pam
    #libsForQt5.dolphin
    libsForQt5.breeze-qt5
    #libsForQt5.qtstyleplugins
    #libsForQt5.bismuth
    #libsForQt5.kalendar

    # Gnome
    #resources
    newsflash
    #turtle
    #tangram
    metadata-cleaner
    curtail
    #komikku

    # Productivity
    obsidian
    #unstable.openboard
    #zotero
    unstable.typst
    unstable.typstyle
    texliveFull
    pdfpc
    #unstable.polylux2pdfpc
    hieroglyphic

    # Chat
    element-desktop
    discord
    thunderbird
    #teamspeak5_client
    #protonmail-bridge
    signal-desktop

    # Security
    keepassxc
    pynitrokey
    #nitrokey-app2 # Installed via flatpak
    openssl
    #nmap
    age
    gnupg

    # Networking
    arp-scan
    rustscan
    #netsleuth
    wireshark

    # Editor
    unstable.neovim
    #unstable.zed-editor
    fd
    tree-sitter

    # Programming stuff
    git
    lazygit
    delta
    nodejs_20
    lua51Packages.lua
    lua51Packages.luarocks
    lua51Packages.jsregexp
    gcc
    cmake
    lldb # debuger
    #dbeaver-bin
    #gopls # lsp
    clang-tools # lsp (cpp / c ?)
    biome #lsp + other things
    vscode-langservers-extracted # lsp (html, css, json, eslint)
    emmet-ls # lsp
    nil # lsp
    lua-language-server # lsp
    docker-ls # lsp
    yaml-language-server # lsp
    taplo # lsp
    #typst-lsp # lsp
    unstable.tinymist # lsp
    nodePackages.vscode-json-languageserver # json
    #nodePackages.pyright # lsp python
    unstable.ruff # formatter python
    python3Packages.python-lsp-server # lsp python
    python3Packages.python-lsp-ruff # lsp python
    python3Packages.pylsp-rope # lsp python
    python3Packages.pylsp-mypy # lsp python
    #tailwindcss-language-server # lsp
    #nodePackages.svelte-language-server # lsp
    #nodePackages.typescript-language-server # lsp

    # Gaming
    prismlauncher
    unstable.lutris
    protonup-qt
    wineWowPackages.waylandFull
    gnome.zenity
    xterm
    xdelta
    #corectrl
    #minetest
    mindustry
    moonlight-qt
    ryujinx
    #airshipper # Not working ?!
    #wesnoth

    # Multimedia
    vlc
    obs-studio
    #libsForQt5.kdenlive
    gimp
    upscayl
    inkscape
    gnome.adwaita-icon-theme # fix the missing icons in inkscape
    krita
    freetube
    #mpv
    #deluge-gtk
    fragments
    gnome-podcasts
    unstable.calibre

    # Virtualisation
    #waydroid
    virt-manager
    virtiofsd

    # System
    #piper
    hardinfo
    lm_sensors
    btrfs-progs
    btrfs-heatmap
    ntfs3g
    fuse3
    impression

    # Network
    #networkmanagerapplet
    #blueman
    #bluez
    #bluez-alsa
    #bluez-tools

    # NixOS tools
    alejandra

    # Office
    #libreoffice-fresh
    unstable.pandoc
    #unstable.drawio
    unstable.d2
    anki-bin
    #nextcloud-client
    #unstable.hplipWithPlugin
    #giac-with-xcas # Impossible to run on my laptop with display scaling
    sageWithDoc
    unstable.rnote
    unstable.taskwarrior3
    taskwarrior-tui
    planify
    hledger
    hledger-web
    hledger-ui

    # Fonts
    #nerdfonts
    font-awesome_6

    # 3D
    freecad
    blender-hip

    # Other
    #feh
    #pavucontrol
    xdg-utils
    #unstable.ollama
    unstable.alpaca
    #unstable.nh
    alsa-utils
  ];
}
