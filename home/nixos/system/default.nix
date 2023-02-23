{ config, pkgs, ... }:

{
  # Imports all config files
  imports =
    [
      ./boot.nix
      ./services.nix
      #./x11.nix
      ./wayland.nix
    ];
}
