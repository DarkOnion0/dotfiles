# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  imports = [
    # Framework custom code
    <nixos-hardware/framework/16-inch/7040-amd>
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fm16"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.udev.packages = [pkgs.gnome.gnome-settings-daemon];

  # Enable the Plasma 6 Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.displayManager.sddm.wayland.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "fr";
    xkbVariant = "azerty";
  };

  # Improve support for my XP-PEN Artist Pro Gen2
  #services.xserver.digimend.enable = true;
  services.xserver.inputClassSections = [
    ''
      Identifier "XP-Pen Artist Pro 16 (Gen2) Tablet"
      MatchUSBID "28bd:095b"
      MatchIsTablet "on"
      MatchDevicePath "/dev/input/event*"
      Driver "wacom"
    ''
    ''
      Identifier "XP-Pen Artist Pro 16 (Gen2) Tablet"
      MatchUSBID "28bd:095b"
      MatchIsTablet "on"
      MatchDevicePath "/dev/input/event*"
      Driver "libinput"
    ''
  ];
  services.input-remapper.enable = true;
  #services.udev.extraHwdb = ''
  #  evdev:input:b0003v28BDp0904e0100-e0*
  #    KEYBOARD_KEY_d0045=0x14c
  #'';

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [pkgs.gutenprint pkgs.hplip pkgs.hplipWithPlugin];

  # Enable support for my logitech mouse
  #services.ratbagd.enable = true;

  # Enable anti-virus
  services.clamav = {
    updater.enable = true;
    daemon.enable = false; # For power constraint
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable corectrl
  programs.corectrl.enable = false;

  # Enable the fingerprint sensor
  services.fprintd.enable = true;

  # Enable support for my nitrokey3
  hardware.nitrokey.enable = true;
  hardware.gpgSmartcards.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dark = {
    isNormalUser = true;
    description = "dark";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.fish;
    #packages = with pkgs; [
    #  #  thunderbird
    #  librewolf
    #  brave

    #  keepassxc
    #
    #  neovim
    #  btop
    #];
  };
  programs.fish.enable = true;

  # Enable firemware update
  services.fwupd.enable = true;

  # Install steam
  programs.steam.enable = true;

  # Install ollama
  services.ollama = {
    enable = false;
    acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1103"; # used to be necessary, but doesn't seem to anymore
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable automatic garbage collector
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";

  # Enable nix experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable OpenGL/OpenCL support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    #extraPackages = with pkgs; [
    #  amdvlk
    #];
    #extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };

  # HIP
  #systemd.tmpfiles.rules = let
  #  rocmEnv = pkgs.symlinkJoin {
  #    name = "rocm-combined";
  #    paths = with pkgs.rocmPackages; [
  #      rocblas
  #      hipblas
  #      clr
  #    ];
  #  };
  #in [
  #  "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  #];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    podman-compose

    #gnomeExtensions.espresso # Broken
    #gnomeExtensions.desaturated-tray-icons # Broken
    gnomeExtensions.appindicator
  ];

  # Enable protonmail-bridge
  services.protonmail-bridge = {
    enable = false;
    path = with pkgs; [pass gnome-keyring];
  };

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable podman
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Enable power management
  #powerManagement = {
  #  enable = false;

  #  powertop.enable = true;
  #};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable GnuGPG agent for ssh system wide
  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;

  # Enable tailscale
  services.tailscale = {
    enable = true;
    package = unstable.tailscale;
    openFirewall = true;
    extraUpFlags = [
      "--hostname ${config.networking.hostName}"
    ];
  };

  # Uniformize theming
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
