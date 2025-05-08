{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.udev.packages = [pkgs.gnome.gnome-settings-daemon];

  # Uniformize theming
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #gnomeExtensions.espresso # Broken
    #gnomeExtensions.desaturated-tray-icons # Broken
    gnomeExtensions.hide-top-bar
    gnomeExtensions.appindicator
  ];
}
