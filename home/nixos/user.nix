{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dark = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "libvirtd" "wireshark" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  # Global user settings
  users.defaultUserShell = pkgs.fish;
}
