# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #############
  ## Network ##
  #############

  networking.hostName = "onion"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp39s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  ##############################
  ## Time & Local preferences ##
  ##############################

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  #########
  ## X11 ##
  #########

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "fr";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  ##############################
  ## User Account (groups...) ##
  ##############################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dark = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };
  # Global user settings
  users.defaultUserShell = pkgs.fish;
  
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
    # Command line and console stuff
    alacritty
    git
    curl
    tmux
    fish
    wget
    starship
    youtube-dl
    neofetch
    inxi
    htop
    zip
    exa
    bat
    powerline

    # Backup tool
    restic
    syncthing
    gparted
    
    # WebBrowser
    firefox
    brave

    # KDE plasma
    latte-dock
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.ark
    libsForQt5.kcalc
    libsForQt5.filelight
    libsForQt5.qt5.qttools
    libsForQt5.akonadi

    # Office
    libreoffice-still
    teams
    drawio
    flameshot

    # Chat
    element-desktop
    discord
    
    # Security
    keepassxc
    
    # Editor 
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    vscodium
    jetbrains.idea-ultimate

    # Programming stuff
    go
    python3
    docker

    # Server
    kubectl
    lens
    
    # Gaming
    steam
    multimc
    corectrl

    # Multimedia 
    spotify
    vlc
    obs-studio
    libsForQt5.kdenlive
    gimp
  ];


  # Enable steam as the doc says
  programs.steam.enable = true;

  # Fish config
  programs.fish.enable = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  ############################################
  ## List services that you want to enable: ##
  ############################################

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable syncthing
  services = {
    syncthing = {
        enable = true;
        user = "dark";
        #dataDir = "/home/myusername/Documents";
        configDir = "/home/dark/.config/syncthing";
    };
  };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

