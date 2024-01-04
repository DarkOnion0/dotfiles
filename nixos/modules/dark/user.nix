{
  config,
  pkgs,
  ...
}: {
  users = {
    users.dark = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker" "networkmanager" "libvirtd" "wireshark"]; # Enable ‘sudo’ for the user.
      shell = pkgs.nushell;
    };

    # Global user settings
    defaultUserShell = pkgs.bash;
  };
}
