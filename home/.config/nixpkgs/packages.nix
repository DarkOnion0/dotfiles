{
  pkgs,
  config,
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

    # Backup tool
    restic
    syncthing
    gparted

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
    unstable.obsidian
    #zotero
    unstable.typst

    # Chat
    #element-desktop
    discord
    thunderbird
    teamspeak5_client
    #protonmail-bridge
    signal-desktop

    # Security
    keepassxc
    pynitrokey
    wireshark
    arp-scan
    openssl
    nmap
    age
    gnupg
    pinentry-curses
    pinentry

    # Editor
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    unstable.neovim
    vscodium
    jetbrains.idea-ultimate
    fd
    tree-sitter

    # Programming stuff
    git
    delta
    go
    nodejs_20
    unstable.cargo
    luajitPackages.luarocks
    gcc
    cmake
    docker
    podman
    buildah
    dbeaver
    direnv
    universal-ctags

    # Server
    lens
    rpi-imager
    unstable.fly
    etcher

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
    calibre

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
    flameshot
    anki-bin
    nextcloud-client
    homebank
    xfce.thunar
    unstable.hplipWithPlugin
    geogebra6
    giac-with-xcas
    unstable.sage
    zathura

    # 3D
    freecad
    blender

    # Other
    feh
    pavucontrol
    xdg-utils
  ];
}
