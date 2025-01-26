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
      );
    shell = pkgs.fish;
    #packages = with pkgs; [
    #  #  thunderbird
    #  librewolf
    #  brave

    #  keepassxc
    #
    #  neovim
    #  btop
    #];
  };
  programs.fish.enable = true;
}
