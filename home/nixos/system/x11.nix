{ config, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  # Enable Gnome Desktop Environement
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
  #services.dbus.packages = with pkgs; [ gnome2.GConf ];
  #qt5.enable = true;
  #qt5.platformTheme = "gtk2";
  #qt5.style = "gtk2";

  # Configure keymap in X11
  services.xserver.layout = "fr";
  services.xserver.xkbOptions = "eurosign:e";
}
