{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable automatic garbage collector
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";

  # Enable nix experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
  ];

  system.rebuild.enableNg = true;
}
