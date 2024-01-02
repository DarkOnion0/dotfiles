{
  pkgs,
  config,
  ...
}: {
  imports = [
    (import ./fish.nix {inherit pkgs config;})
    (import ./nu.nix {inherit pkgs config;})
    (import ./zellij.nix {inherit pkgs config;})
  ];
}
