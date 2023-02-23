{
  perSystem = { inputs', pkgs, ... }: {
    # Definitions like this are entirely equivalent to the ones
    # you may have directly in flake.nix.
    devShells.default = pkgs.mkShellNoCC {
      sopsPGPKeyDirs = ["./nixos/secrets/keys"];
      sopsCreateGPGHome = true;
      nativeBuildInputs = [
        # Nix 
        pkgs.rnix-lsp
        pkgs.alejandra
      ];
    };
  };
}
