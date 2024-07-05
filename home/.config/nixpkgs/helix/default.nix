{unstable, ...}: {
  imports = [
    ./config.nix
    ./language.nix
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = unstable.helix;
  };
}
