{
  pkgs,
  config,
  ...
}: {
  systemd.user.services = {
    sunshine = {
      Unit.Description = "Sunshine is a Game stream host for Moonlight.";
      Service = {
        ExecStart = "${pkgs.sunshine}/bin/sunshine";
        Restart = "always";
        RestartSec = "1s";
      };
      Install.WantedBy = ["graphical-session.target"];
    };
  };
}
