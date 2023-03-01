{pkgs, lib, config, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
      package = pkgs.nerdfonts;
    };
    
    settings = {
      disable_ligatures = "never";
      startup_session = "./sessions/default.conf";
    };

    theme = "Catppuccin-Macchiato";
  };
}
