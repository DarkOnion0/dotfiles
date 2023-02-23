{ self, nixpkgs, flake-utils, ... }@inputs:

let
  inherit (flake-utils.lib) eachDefaultSystem mkApp;
in
{

  mkNixOSConfig =
    { hostname
    , system ? "x86_64-linux"
    , nixosSystem ? nixpkgs.lib.nixosSystem
    , extraModules ? [ ]
    }:
    {
      nixosConfigurations.${hostname} = nixosSystem {
        inherit system;
        modules = [ ../nixos/${hostname}/configuration.nix ] ++ extraModules;
        specialArgs = {
          inherit system;
          flake = self;
        };
      };
    };
}
