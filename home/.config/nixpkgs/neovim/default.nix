{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim;
  };

  imports = [
    ./coc.nix
  ];
}
