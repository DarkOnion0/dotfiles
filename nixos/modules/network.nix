{ config
, pkgs
, ...
}: {
  networking = {
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.enp39s0.useDHCP = true;

    # Enforce firewall on by defautl
    firewall.enable = true;

    # Enable networkmanager
    networkmanager.enable = true;
  };
}
