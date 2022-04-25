{ config, writeTextFile, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dark";
  home.homeDirectory = "/home/dark";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable the use of i3-gaps with kde plasma
  xdg.configFile."plasma-workspace/env/kde_i3-gaps.sh" = {
    executable = true;
    text = ''
      #!/bin/sh
      export KDEWM=/usr/bin/i3
    '';
  };
}
