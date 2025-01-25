{...}: {
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = false;

    enableSshSupport = true;

    enableFishIntegration = true;
    enableNushellIntegration = true;

    sshKeys = [
      "DC49D0602A40936903F2583B734CB5229E6646C3"
    ];
  };
}
