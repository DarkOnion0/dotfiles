{ config, lib, pkgs, ... }:

{
  imports = [
    ./nix-daemon.nix
    ./i18n.nix
    ./cups.nix
    ./network.nix
    ./sound.nix
    ./packages.nix
    #./boot.nix
  ];
}
