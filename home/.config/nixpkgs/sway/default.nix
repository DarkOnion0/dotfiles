{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    ./misc.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      # Screen

      startup = [
        # Main
        {command = "swaylock";}

        # Workspace 1
        {command = "librewolf";}

        # Workspace 2
        {command = "kitty";}

        # Workspace 3
        {command = "obsidian";}
        #{command = "anki";}

        # Workspace 8
        #{command = "brave";}
        #{command = "flatpak run dev.aunetx.deezer";}

        # Workspace 9
        {command = "sleep 10 && element-dekstop";}
        {command = "discord";}
        {command = "sleep 10 && signal-dekstop";}

        # Workspace 10
        {command = "keepassxc";}
        {command = "corectrl";}

        # Background
        {command = "ulauncher --hide-window ";}
      ];

      workspaceLayout = "tabbed";
      defaultWorkspace = "1";
      workspaceOutputAssign = [
        # Center Screen - AOC
        {
          output = "DP-3";
          workspace = "1";
        }
        {
          output = "DP-3";
          workspace = "2";
        }
        {
          output = "DP-3";
          workspace = "3";
        }
        {
          output = "DP-3";
          workspace = "4";
        }
        {
          output = "DP-3";
          workspace = "5";
        }

        # Left Screen - PHILIPS
        {
          output = "HDMI-A-1";
          workspace = "6";
        }
        {
          output = "HDMI-A-1";
          workspace = "7";
        }
        {
          output = "HDMI-A-1";
          workspace = "8";
        }
        {
          output = "HDMI-A-1";
          workspace = "9";
        }
        {
          output = "HDMI-A-1";
          workspace = "10";
        }
      ];
      assigns = {
        "1" = [
          {class = "Vivaldi-stable";}
          {app_id = "librewolf";}
        ];
        "2" = [
          {class = "obsidian";}
          {class = "Anki";}
        ];
        "6" = [
          {app_id = "kitty";}
          {app_id = "Alacritty";}
        ];
        "8" = [
          {class = "Brave-browser";}
          {class = "Deezer";}
        ];
        "9" = [
          {class = "Element";}
          {class = "discord";}
          {class = "Signal";}
        ];
        "10" = [
          {app_id = "org.keepassxc.KeePassXC";}
          {app_id = "corectrl";}
          {class = "Spotify";}
        ];
      };
      window = {
        commands = [
          # Ulauncher
          {
            command = "border none";
            criteria = {
              app_id = "ulauncher";
            };
          }

          # Xcas
          {
            command = "floating enable";
            criteria = {
              title = "Configuration Graphique";
              instance = "FLTK";
            };
          }
          {
            command = "floating enable";
            criteria = {
              title = "Index";
              instance = "FLTK";
            };
          }
          {
            command = "floating enable";
            criteria = {
              title = "^Xcas Configuration.*";
              instance = "FLTK";
            };
          }
          {
            command = "floating enable";
            criteria = {
              title = "^Xcas Fenêtre.*";
              instance = "FLTK";
            };
          }
        ];
      };
      output = let
        bg = "/home/dark/Blender/render/learning_render8V3.png fill";
      in {
        DP-3 = {
          #inherit bg;

          mode = "2560x1440@143.912Hz";
          #scale = "1.15"; # Make things look blury...
          pos = "0 0";
        };
        HDMI-A-1 = {
          #inherit bg;

          pos = "2560 0";
        };
      };

      # Keyboard
      modifier = "Mod4"; # Normal mode
      #modifier = "Mod1"; # Sunshine streaming mode

      keybindings = lib.mkOptionDefault {
        # Generic Commands
        "${modifier}+Shift+a" = "kill";

        # Shortcut
        "${modifier}+Escape" = "exec swaylock";
        "${modifier}+d" = "exec ulauncher";
        #"${modifier}+d" = "exec rofi -show drun -show-icons";
        "${modifier}+p" = "exec flameshot gui";
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
      input = {
        "*" = {
          xkb_layout = "fr";
        };
      };

      # Misc

      bars = [
        {
          mode = "dock";
          fonts = {
            size = 10.0;
            names = ["FiraCodeNerdFont" "FontAwesome5Free"];
          };
          command = "waybar";
          position = "top";
        }
      ];

      # Use kitty as default terminal
      terminal = "kitty";
    };
    extraConfig = ''
    '';
  };
}
