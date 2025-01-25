{
  pkgs,
  config,
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

    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = "${config.home.homeDirectory}/.config/rofi/themes/nord.rofi";
    };

    waybar = {
      enable = true;

      settings = {
        topbar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [
            "DP-3"
            "HDMI-A-1"
          ];
          modules-left = ["sway/workspaces"];
          modules-center = ["sway/window"];
          modules-right = ["privacy" "pulseaudio" "clock" "tray"];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = false;
          };

          pulseaudio = {
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon}";
            format-muted = "";
            format-icons = {
              "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
              "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              phone-muted = "";
              portable = "";
              car = "";
              default = ["" ""];
            };
            scroll-step = 1;
            on-click = "pavucontrol";
            ignored-sinks = ["Easy Effects Sink"];
          };

          clock = {
            interval = 1;
            format = "{:%F - %T}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "year";
              mode-mon-col = 2;
              weeks-pos = "right";
              on-scroll = 1;
              format = {
                months = "<span color='#ffead3'><b>{}</b></span>";
                days = "<span color='#ecc6d9'><b>{}</b></span>";
                weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
            actions = {
              on-click-right = "mode";
              on-click-forward = "tz_up";
              on-click-backward = "tz_down";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };
        };
      };

      #style = ''
      #  .topbar {
      #    font-size: 15px;
      #  }
      #'';
    };
  };

  services = {
    mako = {
      enable = true;
      defaultTimeout = 10000;
    };
  };
}
