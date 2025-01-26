{
  # Enable support for my nitrokey3
  hardware.nitrokey.enable = true;
  hardware.gpgSmartcards.enable = true;

  # Enable GnuGPG agent for ssh system wide
  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
