{
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    desktopManager = {
      xterm.enable = true; # I3
    };

    displayManager = {
      sddm.enable = true; # Plasma
      defaultSession = "none+i3"; # I3
    };

    # I3
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };
}
