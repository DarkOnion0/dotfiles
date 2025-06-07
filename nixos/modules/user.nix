{user}: {
  pkgs,
  config,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups =
      ["wheel"]
      ++ (
        if config.networking.networkmanager.enable
        then ["networkmanager"]
        else []
      ) ++ (
        if config.programs.virt-manager.enable
        then ["libvirtd"]
        else []
      );
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
