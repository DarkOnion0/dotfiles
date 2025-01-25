{
  config,
  pkgs,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  # Gnome specific settings
  #services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
  #services.dbus.packages = with pkgs; [ gnome2.GConf ];

  # Cross DE / WM QT theming
  qt5.enable = true;
  #qt5.platformTheme = "gtk2";
  qt5.style = "gtk2";
  qt5.platformTheme = "qt5ct";

  # Configure keymap in X11
  services.xserver.layout = "fr";
  services.xserver.xkbOptions = "eurosign:e";

  # DE / WM settings
  services.xserver = {
    desktopManager = {
      xterm.enable = false; # I3
      plasma5.enable = false; # Plasma
      gnome.enable = false;
    };

    displayManager = {
      sddm.enable = true; # Plasma
      defaultSession = "none+i3"; # I3
      gdm.enable = false;
    };

    # I3
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };
  #xsession.windowManager.command = "sway";
}
