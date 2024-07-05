{...}: {
  programs.nushell = {
    enable = true;
    configFile.source = ./nu/config.nu;
    envFile.source = ./nu/env.nu;
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
    enableFishIntegration = false;
    enableZshIntegration = false;
  };
}
