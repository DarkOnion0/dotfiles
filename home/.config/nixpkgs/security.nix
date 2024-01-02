{
  pkgs,
  config,
  ...
}: {
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableFishIntegration = true;
    sshKeys = [
      "DC49D0602A40936903F2583B734CB5229E6646C3"
    ];
  };
}
