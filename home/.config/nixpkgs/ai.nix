{
  pkgs,
  config,
  ...
}: {
  systemd.user.services = {
    ollama = {
      Unit.Description = "Ollama server backend";
      Service = {
        ExecStart = "nix shell github:abysssol/ollama-flake#cpu --command ollama serve";
        Restart = "always";
        RestartSec = "10s";
      };
      Install.WantedBy = ["graphical-session.target"];
    };
  };
}
