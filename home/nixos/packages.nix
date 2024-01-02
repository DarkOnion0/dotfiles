{
  pkgs,
  config,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  imports = [<home-manager/nixos>];
  ################################################################
  ## List packages installed in system profile. To search, run: ##
  ## $ nix search wget                                          ##
  ################################################################

  # Enable automatic garbage collector
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";

  # Enable hyprland cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Enable unfree pkgs
  nixpkgs.config.allowUnfree = true;

  # Add overlay
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  # Package list

  #programs.seahorse.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };

  # Enable steam as the doc says
  programs.steam.enable = true;

  # Fish config
  programs.fish.enable = true;

  # Enable corectrl
  programs.corectrl = {
    enable = true;
    gpuOverclock = {
      ppfeaturemask = "0xffffffff";
      enable = true;
    };
  };

  programs.dconf.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  security.polkit.enable = true;

  # Flatpak install -> https://flatpak.org/setup/NixOS
  # - com.github.alainm23.planner
  services.flatpak.enable = true;
  xdg.portal.enable = true;

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

  environment.systemPackages = with pkgs; [
    gnome.gnome-keyring
  ];

  fonts.fonts = with pkgs; [
    font-awesome_5
    font-awesome_6
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    google-fonts
  ];
}
