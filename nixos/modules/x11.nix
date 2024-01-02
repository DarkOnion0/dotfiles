{
  lib,
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;

    # Configure keymap in X11
    layout = "fr";
    xkbOptions = "eurosign:e";
  };
}
