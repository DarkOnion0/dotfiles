{
  description = "A very basic flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    #nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Flake related stuff
    flake-utils.url = "github:numtide/flake-utils";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    nixos-hardware,
    ...
  }@inputs:
  let
    inherit (flake-utils.lib) eachDefaultSystem;
    inherit (import ./lib/attrsets.nix { inherit (nixpkgs) lib; }) recursiveMergeAttrs;
    inherit (import ./lib/flake.nix inputs) mkNixOSConfig;
  in
  (recursiveMergeAttrs [
      # NixOS configs
      (mkNixOSConfig { 
        hostname = "onion";
        extraModules = [
          nixos-hardware.nixosModules.common-cpu-amd-pstate
          nixos-hardware.nixosModules.common-gpu-amd
          nixos-hardware.nixosModules.common-pc-ssd
        ];
      })

      # shell.nix
      (eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              rnix-lsp
              alejandra
            ];
          };
        }))
    ]); # END recursiveMergeAttrs
}
