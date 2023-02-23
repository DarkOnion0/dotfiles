{ pkgs, config, unstable, ... }: 
{
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
    swaylock-effects
    swayidle
    wl-clipboard

    # CLI
    curl
    killall
    wget
    youtube-dl
    neofetch
    inxi
    htop
    zip
    exa
    bat
    tree
    viddy
    p7zip
    ripgrep
    ranger

    # Backup tool
    restic
    syncthing
    gparted

    # Shell and prompt
    fish
    zsh
    starship
    powerline
    fzf

    # Terminal app
    alacritty
    kitty
    pixcat
    tmux

    # WebBrowser
    firefox
    brave
    librewolf
    vivaldi
    vivaldi-widevine
    vivaldi-ffmpeg-codecs

    # KDE plasma
    #latte-dock
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.ark
    libsForQt5.kcalc
    libsForQt5.filelight
    libsForQt5.qt5.qttools
    libsForQt5.akonadi
    libsForQt5.okular
    libsForQt5.gwenview
    libsForQt5.karchive
    #libsForQt5.krunner
    #libsForQt5.kcolorpicker
    libsForQt5.kcolorchooser
    #libsForQt5.kwallet
    #libsForQt5.kwallet-pam
    #libsForQt5.dolphin
    #libsForQt5.breeze-qt5
    libsForQt5.qtstyleplugins
    #libsForQt5.bismuth
    libsForQt5.kalendar

    # Productivity
    unstable.ferdium
    #notion-app-enhanced
    unstable.appflowy
    obsidian
    zotero

    # Printing
    cups
    gutenprint

    # Chat
    #element-desktop
    #discord
    #electron-mail
    thunderbird
    birdtray
    #protonmail-bridge
    signal-desktop

    # Security
    keepassxc
    wireshark
    arp-scan
    openssl
    nmap
    #kubescape
    age
    gnupg
    pinentry-curses
    pinentry
    #sops

    # Editor 
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    unstable.neovim
    #neovim-nightly
    vscodium
    jetbrains.idea-ultimate
    fd
    tree-sitter

    # Programming stuff
    git
    delta
    go
    nodejs-16_x
    jdk
    #yarn
    #python3
    gcc
    docker
    podman
    buildah
    #skopeo
    gitkraken
    dbeaver
    #android-tools # Just for some android installation --> use nix-shell
    direnv
    universal-ctags

    # Server
    #kubectl
    #kubernetes-helm
    lens
    rpi-imager
    unstable.fly
    #etcher
    #ansible
    #xrdp
    #rustdesk

    # Gaming
    prismlauncher
    corectrl
    lutris
    wine-staging
    amdvlk
    minetest
    #mindustry
    gnome.zenity
    xterm
    xdelta

    # Multimedia 
    spotify
    vlc
    obs-studio
    libsForQt5.kdenlive
    gimp
    inkscape
    freetube
    mpv

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

    # Network
    networkmanagerapplet
    blueman
    bluez
    bluez-alsa
    bluez-tools

    # NixOS tools
    #nixpkgsreview
    nixfmt
    alejandra

    # Office
    libreoffice-still
    #teams
    drawio
    unstable.d2
    flameshot
    anki-bin
    nextcloud-client
    homebank
    xfce.thunar

    # Fonts
    font-awesome
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    # Other 
    feh
    pavucontrol
  ];
}
