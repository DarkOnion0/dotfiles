{
  config,
  pkgs,
  lib,
  ...
}: {
  networking = {
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.enp39s0.useDHCP = true;

    # Enforce firewall on by defautl
    firewall = {
      allowedTCPPorts = [3389];
      enable = true;
      # always allow traffic from your Tailscale network
      trustedInterfaces = lib.mkIf config.services.tailscale.enable ["tailscale0"];
      # allow the Tailscale UDP port through the firewall
      allowedUDPPorts = [(lib.mkIf config.services.tailscale.enable config.services.tailscale.port)];
    };

    # Enable networkmanager
    networkmanager.enable = true;
  };
}
