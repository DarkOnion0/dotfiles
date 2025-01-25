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

  # Editor related stuffs

  editorconfig.enable = true;
  programs.neovim.defaultEditor = true;

  # Addons

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zoxide.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      directory = {
        truncation_length = 8;
        home_symbol = "~";
      };
      username = {
        show_always = true;
        format = "[$user]($style)@";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
      };
    };
  };
}
