{
  inputs,
  hostName,
  user,
  ...
}: {
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.framework-16-inch-7040-amd

    (import ./../../modules/user.nix {inherit user;})

    ./../../modules/laptop.nix
    ./../../modules/sound.nix

    ./../../modules/gnome.nix

    ./../../modules/xppen.nix
    ./../../modules/clamav.nix
    ./../../modules/gaming.nix

    ./../../modules/container.nix
    ./../../modules/flatpak.nix

    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  networking = {inherit hostName;};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
