{config, ...}: {
  hardware.bluetooth.enable = true;

  # Enable blueman
  services.blueman.enable = true;
}
