{
  config,
  pkgs,
  lib,
  ...
}: {
  # TODO merge the HM config
  security.pam.services.swaylock = {
    text = "auth include login";
  };

  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
}
