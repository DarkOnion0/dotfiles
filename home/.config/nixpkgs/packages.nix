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
    swayidle
    wl-clipboard
    ulauncher

    # CLI
    curl
    killall
    wget
    youtube-dl
    neofetch
    inxi
    btop
    zip
    unzip
    bat
    tree
    viddy
    p7zip
    ripgrep # needed for telescope.nvim
    ranger
    carapace
    dua
    difftastic

    # Backup tool
    restic
    syncthing
    gparted
    localsend

    # Shell and prompt
    fish
    starship
    powerline
    fzf

    # Terminal app
    #kitty
    pixcat
    alacritty
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
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.ark
    libsForQt5.kcalc
    #libsForQt5.filelight
    libsForQt5.qt5.qttools
    libsForQt5.akonadi
    #libsForQt5.okular
    libsForQt5.gwenview
    libsForQt5.karchive
    #libsForQt5.krunner
    #libsForQt5.kcolorpicker
    libsForQt5.kcolorchooser
    #libsForQt5.kwallet
    #libsForQt5.kwallet-pam
    #libsForQt5.dolphin
    libsForQt5.breeze-qt5
    libsForQt5.qtstyleplugins
    #libsForQt5.bismuth
    #libsForQt5.kalendar

    # Productivity
    #unstable.ferdium
    #notion-app-enhanced
    #unstable.appflowy
    obsidian
    unstable.openboard
    zotero
    unstable.typst
    pdfpc
    unstable.polylux2pdfpc

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
    nitrokey-app2
    wireshark
    arp-scan
    openssl
    nmap
    age
    gnupg
    #pinentry-curses
    #pinentry

    # Editor
    neovim
    vscodium
    fd
    tree-sitter

    # Programming stuff
    git
    delta
    go
    nodejs_20
    luajitPackages.luarocks
    gcc
    cmake
    docker
    podman
    dbeaver-bin
    #gopls # lsp
    biome #lsp + other things
    vscode-langservers-extracted # lsp (html, css, json, eslint)
    emmet-ls # lsp
    nil # lsp
    lua-language-server # lsp
    docker-ls # lsp
    yaml-language-server # lsp
    taplo # lsp
    typst-lsp # lsp
    unstable.tinymist # lsp
    #tailwindcss-language-server # lsp
    #nodePackages.svelte-language-server # lsp
    #nodePackages.typescript-language-server # lsp

    # Server
    rpi-imager

    # Gaming
    prismlauncher
    corectrl
    lutris
    wineWowPackages.waylandFull
    #wineWowPackages.staging
    amdvlk
    minetest
    mindustry
    gnome.zenity
    xterm
    xdelta

    # Multimedia
    vlc
    obs-studio
    libsForQt5.kdenlive
    gimp
    inkscape
    gnome.adwaita-icon-theme # fix the missing icons in inkscape
    krita
    freetube
    mpv
    deluge-gtk
    unstable.calibre

    # Virtualisation
    #waydroid
    virt-manager
    virtiofsd

    # System
    piper
    hardinfo
    lm_sensors
    btrfs-progs
    btrfs-heatmap
    ntfs3g
    fuse3

    # Network
    networkmanagerapplet
    blueman
    bluez
    bluez-alsa
    bluez-tools

    # NixOS tools
    alejandra

    # Office
    libreoffice-fresh
    unstable.pandoc
    unstable.drawio
    unstable.d2
    #d2
    flameshot
    anki-bin
    nextcloud-client
    homebank
    xfce.thunar
    unstable.hplipWithPlugin
    #geogebra6
    giac-with-xcas
    #unstable.sage
    zathura
    unstable.rnote
    taskwarrior3
    timewarrior

    # 3D
    freecad
    #blender-hip # Not working :(
    blender

    # Other
    feh
    pavucontrol
    xdg-utils
    unstable.ollama
  ];
}
