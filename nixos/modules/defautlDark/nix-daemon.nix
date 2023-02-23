{lib, config, ...}: {
  nix = {
    buildMachines = [
      {
        system = "aarch64-linux";
        sshKey = "/home/dark/.ssh/id_ed25519";
        sshUser = "familiaris";
        hostName = "192.168.1.23";
      }
    ];

    distributedBuilds = true;

    extraOptions = ''
      builders-use-substitutes = true
    '';
  };
}
