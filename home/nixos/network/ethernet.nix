{
  config,
  services,
  pkgs,
  ...
}: {
  #############
  ## Network ##
  #############

  networking.hostName = "onion"; # Define your hostname.

  networking.useDHCP = false;
  networking.interfaces.enp39s0.useDHCP = true;

  networking.firewall = {
    enable = true;
    # always allow traffic from your Tailscale network
    trustedInterfaces = ["tailscale0"];
  };
  networking.firewall.allowedTCPPorts = [
    # Python web server
    8000
  ];
  networking.firewall.allowedUDPPorts = [
    # allow the Tailscale UDP port through the firewall
    config.services.tailscale.port

    # Sunshine -> doesn't work
    # 47998 # Video
    # 47999 # Control
    # 48000 # Audio
    # 48002 # Mic
  ];

  # Set default DNS
  networking = {
    nameservers = ["127.0.0.1" "::1" "100.100.100.100" "1.1.1.1" "192.168.1.23"];
    resolvconf.enable = pkgs.lib.mkForce false;
    # If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager.enable = true;
    networkmanager.dns = "none";
  };

  services.resolved.enable = false;
}
