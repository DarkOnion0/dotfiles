{
  # Install steam
  programs.steam.enable = true;

  # Enable OpenGL/OpenCL support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    #extraPackages = with pkgs; [
    #  amdvlk
    #];
    #extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };
}
