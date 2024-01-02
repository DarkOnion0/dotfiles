{
  pkgs,
  lib,
  config,
  modulesPath,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMonoNerdFont";
      size = 13;
      package = pkgs.nerdfonts;
    };

    settings = {
      disable_ligatures = "never";
      startup_session = "${toString ./.}/default.conf";
    };

    theme = "Catppuccin-Macchiato";
  };
}
