{
  description = "A very basic flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Flake related stuff
    flake-parts.url = "github:hercules-ci/flake-parts";

    treefmt-nix.url = "github:numtide/treefmt-nix";

    # Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    deploy-rs.url = "github:serokell/deploy-rs";
  };
  outputs = inputs @ {
    self,
    flake-utils,
    nixpkgs,
    nixos-hardware,
    flake-parts,
    treefmt-nix,
    deploy-rs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        inputs.treefmt-nix.flakeModule
        ./nixos
      ];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        lib,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            # Deployment
            deploy-rs.outputs.packages.${system}.deploy-rs

            # Nix
            alejandra
            nil
            statix
          ];
        };

        treefmt.config = {
          projectRootFile = "flake.nix";
          programs = {
            prettier = {
              enable = true;
              settings.editorconfig = true;
            };
            alejandra.enable = true;
          };
        };

        #checks = {
        #  statix = pkgs.stdenv.mkDerivation {
        #    name = "statix";
        #    src = ./.;
        #    doCheck = true;
        #    nativeBuildInputs = with pkgs; [statix];
        #    checkPhase = ''
        #      statix check .
        #    '';
        #  };
        #};
      };

      #flake.checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
