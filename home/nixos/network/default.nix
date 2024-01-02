{
  config,
  pkgs,
  ...
}: {
  # Imports all config files
  imports = [
    ./bluetooth.nix
    ./ethernet.nix
  ];
}
