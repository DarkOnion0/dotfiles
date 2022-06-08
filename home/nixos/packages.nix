{ pkgs, ... }:

{
  ################################################################
  ## List packages installed in system profile. To search, run: ##
  ## $ nix search wget                                          ##
  ################################################################
  
  # Enable automatic garbage collector
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";

  # Enable unfree pkgs
  nixpkgs.config.allowUnfree = true;

  # Package list

  programs.seahorse.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };

  environment.systemPackages = with pkgs; [
    # Shell and prompt
    fish
    zsh
    starship
    powerline
    fzf

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

    # Terminal app
    alacritty
    tmux

    # Backup tool
    restic
    syncthing
    gparted

    # WebBrowser
    firefox
    brave
    #vivaldi
    #vivaldi-widevine
    #vivaldi-ffmpeg-codecs

    # KDE plasma
    latte-dock
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.ark
    libsForQt5.kcalc
    libsForQt5.filelight
    libsForQt5.qt5.qttools
    libsForQt5.akonadi
    libsForQt5.okular
    libsForQt5.gwenview
    libsForQt5.karchive
    libsForQt5.krunner
    #libsForQt5.kcolorpicker
    libsForQt5.kcolorchooser
    #libsForQt5.kwallet
    #libsForQt5.kwallet-pam
    libsForQt5.dolphin
    libsForQt5.breeze-qt5
    libsForQt5.qtstyleplugins
    #libsForQt5.bismuth

    # i3
    i3-gaps
    rofi
    polybarFull
    i3lock
    xss-lock
    picom
    feh
    pavucontrol
    #ncpamixer
    dunst
    lxappearance
    #ulauncher

    # Network
    networkmanagerapplet
    blueman
    bluez
    bluez-alsa
    bluez-tools

    # Gnome
    #gnome.gnome-tweaks
    #gnomeExtensions.appindicator
    #gnomeExtensions.dash-to-dock
    #gnomeExtensions.floating-dock
    gnome.gnome-keyring

    # NixOS tools
    nixpkgs-review
    nixpkgs-fmt

    # Office
    libreoffice-still
    #teams
    drawio
    flameshot
    anki-bin
    nextcloud-client

    # Productivity
    ferdi

    # Printing
    cups
    gutenprint

    # Chat
    element-desktop
    discord
    #electron-mail
    thunderbird
    birdtray
    protonmail-bridge

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
    neovim
    vscodium
    jetbrains.idea-ultimate

    # Programming stuff
    git
    delta
    go
    nodejs-16_x
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
    kubectl
    #kubernetes-helm
    lens
    rpi-imager
    #etcher
    #ansible
    #xrdp
    #rustdesk

    # Gaming
    steam
    polymc
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
    hardinfo
    lm_sensors
    btrfs-progs
    btrfs-heatmap

    # Blockchain
    ethminer

    # Fonts
    font-awesome
    nerdfonts
  ];
}
