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

  environment.systemPackages = with pkgs; [
    # Shell and prompt
    fish
    starship
    powerline

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
    vivaldi
    vivaldi-widevine
    vivaldi-ffmpeg-codecs

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
    libsForQt5.kwallet
    libsForQt5.kwallet-pam

    # Gnome
    #gnome.gnome-tweaks
    #gnomeExtensions.appindicator
    #gnomeExtensions.dash-to-dock
    #gnomeExtensions.floating-dock

    # NixOS tools
    nixpkgs-review
    nixpkgs-fmt

    # Office
    libreoffice-still
    #teams
    drawio
    flameshot
    anki

    # Printing
    cups
    gutenprint

    # Chat
    element-desktop
    discord
    #electron-mail

    # Security
    keepassxc
    wireshark
    arp-scan
    openssl

    # Editor 
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    vscodium
    jetbrains.idea-ultimate

    # Programming stuff
    git
    go
    nodejs-16_x
    python3
    gcc
    docker
    podman
    buildah
    skopeo
    gitkraken
    dbeaver
    android-tools
    #dart

    # Server
    kubectl
    lens
    rpi-imager
    #etcher
    ansible
    #xrdp

    # Gaming
    steam
    #multimc
    corectrl
    lutris
    gnome.zenity
    wine-staging
    amdvlk
    xterm
    xdelta
    #mindustry

    # Multimedia 
    spotify
    vlc
    obs-studio
    libsForQt5.kdenlive
    gimp
    freetube

    # Virtualisation
    waydroid
    virt-manager
  ];
}
