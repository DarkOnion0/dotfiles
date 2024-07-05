{
  config,
  pkgs,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dark";
  home.homeDirectory = "/home/dark";
  home.keyboard = {
    layout = "fr";
  };

  # Imports

  imports = [
    ./sway

    ./nix.nix

    ./style.nix

    (import ./packages.nix {inherit pkgs config unstable;})

    ./kitty
    ./shell
    (import ./helix {inherit unstable;})

    (import ./sunshine.nix {inherit pkgs config;})

    (import ./ai.nix {inherit pkgs config;})
    #(import ./sage.nix {inherit pkgs config;})

    (import ./security.nix {inherit pkgs config;})
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
