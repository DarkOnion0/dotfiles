{pkgs, ...}: {
  home.packages = with pkgs; [
    sageWithDoc
  ];

  systemd.user.services = {
    sage = {
      Unit.Description = "SageMath is a computer algebra system with features covering many aspects of mathematics";
      Service = {
        ExecStart = "${pkgs.sageWithDoc}/bin/sage -n jupyterlab";
        Restart = "always";
        RestartSec = "10s";
      };
      Install.WantedBy = ["graphical-session.target"];
    };
  };
}
