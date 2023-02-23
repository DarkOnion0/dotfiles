{ config
, pkgs
, lib
, ...
}: {
  networking = {
    hostName = "onion"; # Define your hostname.

    firewall.allowedTCPPorts = [ 3389 ];

    networkmanager = {
      dns = "none";
    };

    resolvconf.enable = pkgs.lib.mkForce false;
    # If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";

    extraHosts =
      ''
        # Genshin logging servers (do not remove!)
        0.0.0.0 log-upload-os.mihoyo.com
        0.0.0.0 overseauspider.yuanshen.com
      
        # Optional Unity proxy/cdn servers
        0.0.0.0 prd-lender.cdp.internal.unity3d.com
        0.0.0.0 thind-prd-knob.data.ie.unity3d.com
        0.0.0.0 thind-gke-usc.prd.data.corp.unity3d.com
        0.0.0.0 cdp.cloud.unity3d.com
        0.0.0.0 remote-config-proxy-prd.uca.cloud.unity3d.com
      '';

    # Add custom DNS
    nameservers = [ "127.0.0.1" "::1" "192.168.1.22" ];
  };

  services.resolved.enable = false;
}
