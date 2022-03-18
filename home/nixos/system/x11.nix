{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable OpenGL/OpenCL support
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
   rocm-opencl-icd
   rocm-opencl-runtime
   amdvlk
  ];
  
  # Enable vulkan support
  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;

  # Enable the Plasma 5 Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Enable Gnome Desktop Environement
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
  #services.dbus.packages = with pkgs; [ gnome2.GConf ];
  #qt5.enable = true;
  #qt5.platformTheme = "gtk2";
  #qt5.style = "gtk2";
  programs.qt5ct.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "fr";
  services.xserver.xkbOptions = "eurosign:e";

  # i3
  services.xserver = {
    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };
}
