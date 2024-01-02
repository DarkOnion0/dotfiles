{
  lib,
  config,
  pkgs,
  ...
}: {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };
}
