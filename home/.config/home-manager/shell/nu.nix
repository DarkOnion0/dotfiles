{...}: {
  programs.nushell = {
    enable = true;
    configFile.source = ./nu/config.nu;
    envFile.source = ./nu/env.nu;
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.direnv.enableNushellIntegration = true;

  programs.zoxide.enableNushellIntegration = true;

  programs.starship.enableNushellIntegration = true;
}
