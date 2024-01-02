{
  pkgs,
  config,
  ...
}: {
  programs.nushell = {
    enable = true;
    configFile.source = ./nu/config.nu;
    envFile.source = ./nu/env.nu;
  };
}
