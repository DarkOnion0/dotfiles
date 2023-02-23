{ config, ... }: {
  services.xserver = {
    desktopManager = {
      plasma5.enable = true; # Plasma
    };

    displayManager = {
      sddm.enable = true; # Plasma
    };
  };
}
