{ config, ... }:

{
  # Enable steam as the doc says
  programs.steam.enable = true;

  # Fish config
  programs.fish.enable = true;

  # Enable Kwallet
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  # Enable some virtualisation software (Podman, docker...)
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      #dockerCompat = true;
    };
    
    docker = {
      enable = true;
    };
  };

  # Enable xrdp
  #services.xrdp.enable = true;
  #services.xrdp.defaultWindowManager = "startplasma-x11";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable syncthing
  services = {
    syncthing = {
        enable = true;
        user = "dark";
        #dataDir = "/home/myusername/Documents";
        configDir = "/home/dark/.config/syncthing";
    };
  };
  
  # Configure keymap in X11
  services.xserver.layout = "fr";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
