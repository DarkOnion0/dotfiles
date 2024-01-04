{
  config,
  pkgs,
  ...
}: {
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [pkgs.gutenprint pkgs.hplip pkgs.hplipWithPlugin];
  };

  # Enable service discovery
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;
}
