{
  config,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.dark = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker" "networkmanager" "libvirtd" "wireshark"]; # Enable ‘sudo’ for the user.
      shell = pkgs.fish;
      openssh.authorizedKeys.keyFiles = ["/home/dark/.ssh/authorized_keys"];
    };

    # Global user settings
    defaultUserShell = pkgs.fish;
  };
}
