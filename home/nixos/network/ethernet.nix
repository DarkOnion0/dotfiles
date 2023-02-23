{ config, services, pkgs, ... }:

{
  #############
  ## Network ##
  #############

  networking.hostName = "onion"; # Define your hostname.

  networking.useDHCP = false;
  networking.interfaces.enp39s0.useDHCP = true;

  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 3389 ];

  # Set default DNS 
  networking = {
    nameservers = [ "127.0.0.1" "::1" "192.168.1.23"];
    resolvconf.enable = pkgs.lib.mkForce false;
    # If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager.enable = true;
    networkmanager.dns = "none";
  };

  services.resolved.enable = false;
}
