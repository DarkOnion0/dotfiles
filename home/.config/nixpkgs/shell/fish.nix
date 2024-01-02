{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;

    loginShellInit = ''
      if [ $XDG_SESSION_TYPE = "tty" ];
          if test (tty) = "/dev/tty1"
              printf "Welcome $USER!"
              sway
          end
      end
    '';

    interactiveShellInit = ''
      set fish_greeting
      set EDITOR "nvim \'\'"
      set VISUAL "codium "

      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
    '';

    shellAliases = {
      e = "nvim --listen /tmp/darknvimsocket";
      vi = "nvim ";
      j = "just ";
      python = "python3 ";

      c = "bat ";
      ls = "exa ";
      l = "exa -al ";

      k = "kubectl ";
      h = "helm ";
      kscan = "kubescape scan framework nsa ";

      serve_file = "python3 -m http.server";

      tn = "tmux new ";
      ta = "tmux attach ";
      tk = "tmux kill-session -t	";

      nixos-edit = "sudo nvim /etc/nixos/configuration.nix";
      nixos-switch = "sudo nixos-rebuild switch";
      nixos-clear = "sudo nix-collect-garbage";
      nixos-delroot = "sudo nix-collect-garbage -d";
      nixos-update = "sudo nixos-rebuild switch --upgrade";

      hm = "home-manager ";

      g = "git "; # Add an alias for git
      gs = "git status ";
      gl = "git log ";
      gc = "git commit ";
      gp = "git push ";
      gpl = "git pull ";
      gd = "git diff ";

      f = "fzf ";
      ff = "fzf --preview 'bat --color always {}' ";

      remoteIp = "echo External IP: (curl -s https://cloudflare.com/cdn-cgi/trace | grep ip | sed -s 's|ip=||g')";

      pomodoroCounter = "nix run github:DarkOnion0/PomodoroCounter#cli -- ";
      pandocTheming = "nix run /home/dark/Programmation/git/PandocTheming2/ -- ";

      rebootToWindows = "systemctl reboot --boot-loader-entry=auto-windows";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      directory = {
        truncation_length = 8;
        home_symbol = "~";
      };
      username = {
        show_always = true;
        format = "[$user]($style)@";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
      };
    };
  };
}
