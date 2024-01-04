{
  config,
  pkgs,
  lib,
  ...
}: {
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      lxqt.enable = true;

      extraPortals = with pkgs; [
        libsForQt5.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
    };
  };
}
