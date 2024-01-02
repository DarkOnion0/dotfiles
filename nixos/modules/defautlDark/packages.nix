{
  config,
  pkgs,
  /*
  pkgsUnstable,
  */
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  programs = {
    seahorse.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "curses";
    };

    steam.enable = true;

    fish.enable = true;

    dconf.enable = true;

    qt5ct.enable = true;
  };

  services = {
    # Enable gnome keyring
    gnome.gnome-keyring.enable = true;

    # Enable clipboard history with VM
    greenclip.enable = true;

    gvfs.enable = true;

    openssh.enable = true;
  };

  security = {
    polkit.enable = true;
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wants = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  ################################################################
  ## List packages installed in system profile. To search, run: ##
  ## $ nix search wget                                          ##
  ################################################################

  environment.systemPackages =
    with pkgs; [
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
      ranger

      # Terminal app
      alacritty
      kitty
      pixcat
      tmux

      # Backup tool
      restic
      syncthing
      gparted

      # WebBrowser
      brave
      librewolf
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
      #libsForQt5.kwallet
      #libsForQt5.kwallet-pam
      libsForQt5.dolphin
      libsForQt5.breeze-qt5
      libsForQt5.qtstyleplugins
      #libsForQt5.bismuth
      libsForQt5.kalendar

      # i3
      i3-gaps
      rofi
      polybarFull
      i3lock
      xss-lock
      picom
      feh
      pavucontrol
      dunst
      lxappearance

      # Network
      networkmanagerapplet
      blueman
      bluez
      bluez-alsa
      bluez-tools

      # Gnome
      gnome.gnome-keyring

      # NixOS tools
      nixpkgs-review
      nixpkgs-fmt

      # Office
      libreoffice-still
      teams
      drawio
      flameshot
      anki-bin
      nextcloud-client

      # Productivity
      unstable.ferdium
      notion-app-enhanced

      # Printing
      cups
      gutenprint

      # Chat
      element-desktop
      discord
      thunderbird
      birdtray
      protonmail-bridge

      # Security
      keepassxc
      wireshark
      arp-scan
      openssl
      nmap
      age
      gnupg
      pinentry-curses
      pinentry
      #sops

      # Editor
      unstable.neovim
      vscodium
      jetbrains.idea-ultimate

      # Programming stuff
      git
      delta
      go
      nodejs-16_x # For coc.nvim
      gcc
      docker
      podman
      buildah
      skopeo
      gitkraken
      dbeaver
      #android-tools # Just for some android installation --> use nix-shell
      direnv
      universal-ctags

      # Server
      kubectl
      lens
      rpi-imager

      # Gaming
      steam
      #polymc
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
    ]
    /*
    ++ (with pkgsUnstable; [
    # productivity
    ferdium
    ])
    */
    ;

  fonts.fonts = with pkgs; [
    font-awesome
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
