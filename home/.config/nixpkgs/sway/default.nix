{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}: 
{
  imports = [
    ./misc.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty";
      startup = [
        # Launch browser on start
        {command = "vivaldi";}
        {command = "corectrl";}
        {command = "ferdium";}
        {command = "keepassxc";}
      ];
      workspaceLayout = "tabbed";
      assigns = {
        "1" = [{class = "Vivaldi-stable";}];
        "9" = [{class = "Ferdium";}];
        "10" = [
          {app_id = "org.keepassxc.KeePassXC";}
          {app_id = "corectrl";}
          {class = "Spotify";}
        ];
      };
      keybindings = lib.mkOptionDefault {
        # Generic Commands
        "${modifier}+Shift+a" = "kill";

        # Shortcut
        "${modifier}+l" = "exec swaylock";
        "${modifier}+d" = "exec rofi -show drun -show-icons";
        "${modifier}+Shift+d" = "exec rofi -show window -show-icons";
        "${modifier}+c" = "exec rofi -modi 'clipboard:greenclip print' -show clipboard";
        "${modifier}+Shift+e" = "exec cat ${toString ./.}/bin/powerMenu.sh | bash";

        # Layout
        "${modifier}+m" = "splith";
        "${modifier}+x" = "splitv";

        "${modifier}+s" = "layout stacking";
        "${modifier}+z" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        # Workspaces
        "${modifier}+ampersand" = "workspace number 1";
        "${modifier}+eacute" = "workspace number 2";
        "${modifier}+quotedbl" = "workspace number 3";
        "${modifier}+apostrophe" = "workspace number 4";
        "${modifier}+parenleft" = "workspace number 5";
        "${modifier}+minus" = "workspace number 6";
        "${modifier}+egrave" = "workspace number 7";
        "${modifier}+underscore" = "workspace number 8";
        "${modifier}+ccedilla" = "workspace number 9";
        "${modifier}+agrave" = "workspace number 10";

        "${modifier}+Shift+ampersand" = "move container to workspace number 1";
        "${modifier}+Shift+eacute" = "move container to workspace number 2";
        "${modifier}+Shift+quotedbl" = "move container to workspace number 3";
        "${modifier}+Shift+apostrophe" = "move container to workspace number 4";
        "${modifier}+Shift+parenleft" = "move container to workspace number 5";
        "${modifier}+Shift+minus" = "move container to workspace number 6";
        "${modifier}+Shift+egrave" = "move container to workspace number 7";
        "${modifier}+Shift+underscore" = "move container to workspace number 8";
        "${modifier}+Shift+ccedilla" = "move container to workspace number 9";
        "${modifier}+Shift+agrave" = "move container to workspace number 10";
      };

      bars = [
        {
          mode = "dock";
          fonts = {
            size = 8.0;
            names = ["FiraCode Nerd Font" "FontAwesome5Free"];
          };
          command = "waybar";
          position = "top";
        }
      ];
    };
    extraConfig = ''
      input type:keyboard {
        xkb_layout fr
      }
    '';
  };
}
