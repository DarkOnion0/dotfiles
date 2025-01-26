{
  self,
  inputs,
  lib,
  ...
}: {
  flake = let
    hosts = [
      {
        user = "dark";
        hostName = "fm16";
      }

      {
        user = "dark";
        hostName = "onion";
      }
    ];
  in {
    nixosConfigurations = builtins.listToAttrs (
      lib.lists.flatten (
        map (
          {
            user,
            hostName,
            system ? "x86_64-linux",
            ...
          }: [
            (lib.nameValuePair hostName (inputs.nixpkgs.lib.nixosSystem {
              inherit system;

              modules = [
                (import ./hosts/${hostName}.nix {inherit inputs hostName;})
                (import ./modules/user.nix {inherit user;})

                ./modules/uefi.nix
                ./modules/network.nix

                ./modules/cups.nix
    
                ./modules/nk.nix

                ./modules/i18n.nix
                ./modules/nix.nix
              ];
            }))
          ]
        )
        hosts
      )
    );
  };
}
