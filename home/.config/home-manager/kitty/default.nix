{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMonoNerdFont";
      size = 10.5;
      package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "IBMPlexMono" ]; });
    };

    settings = {
      disable_ligatures = "never";
      startup_session = "${toString ./.}/default.conf";
    };

    #theme = "Catppuccin-Latte";
    #theme = "Catppuccin-Macchiato";
  };
}
