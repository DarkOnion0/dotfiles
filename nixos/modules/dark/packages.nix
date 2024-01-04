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
  };

  qt.platformTheme = "qt5ct";

  services = {
    # Enable gnome keyring
    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;
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

  environment.systemPackages = with pkgs; [
    gnome.gnome-keyring
  ];

  fonts.packages = with pkgs; [
    font-awesome_5
    font-awesome_6
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    google-fonts
  ];
}
