{ config, pkgs, lib, ... }:
{
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      lxqt.enable= true;

      extraPortals = with pkgs; [
	libsForQt5.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
    };
  };

  security.pam.services.swaylock = {
    text = "auth include login";
  };

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
}
