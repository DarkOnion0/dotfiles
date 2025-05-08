{config, ...}: {
  # Enable tailscale
  services.tailscale = {
    enable = true;
    #package = unstable.tailscale;
    openFirewall = true;
    extraUpFlags = [
      "--hostname ${config.networking.hostName}"
    ];
  };
}
