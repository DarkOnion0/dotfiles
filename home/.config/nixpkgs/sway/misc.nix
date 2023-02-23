{
  pkgs,
  config,
  lib,
  ...
}: {
  programs = {
    swaylock.settings = {
      show-failed-attempts = true;
      screenshots = true;
      clock = true;
      fade-in = 0.2;
      effect-blur = "7x5";
    };

    mako = {
      enable = true;
      defaultTimeout = 10000;
    };

    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = "${config.home.homeDirectory}/.config/rofi/themes/nord.rofi";
    };

    waybar = {
      enable = true;
    };
  };
}
