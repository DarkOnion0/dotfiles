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

  # Gnome specific settings
  #services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
  #services.dbus.packages = with pkgs; [ gnome2.GConf ];

  # Cross DE / WM QT theming
  #qt5.enable = true;
  #qt5.platformTheme = "gtk2";
  #qt5.style = "gtk2";
  #programs.qt5ct.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "fr";
  services.xserver.xkbOptions = "eurosign:e";
	
  # DE / WM settings
  services.xserver = {
    desktopManager = {
      #xterm.enable = false; # I3
      plasma5.enable = true; # Plasma
      gnome.enable = false;
    };
   
    displayManager = {
    	sddm.enable = true; # Plasma
        #defaultSession = "none+i3"; # I3
	gdm.enable = false;
    };

    # I3
    windowManager.i3 = {
      enable = false;
      package = pkgs.i3-gaps;
    };
  };
}
