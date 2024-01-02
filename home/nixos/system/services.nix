{
  config,
  pkgs,
  ...
}: {
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

    libvirtd = {
      enable = true;
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # Tailscale
  services.tailscale.enable = true;

  # Enable syncthing
  services = {
    syncthing = {
      enable = true;
      user = "dark";
      #dataDir = "/home/myusername/Documents";
      configDir = "/home/dark/.config/syncthing";
    };

    udev.packages = [
      (pkgs.writeTextFile {
        name = "numworks-udev-rules";
        text = ''
          SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="a291", TAG+="uaccess"
                SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="df11", TAG+="uaccess"
        '';
        destination = "/lib/udev/rules.d/50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules";
      })
      (pkgs.writeTextFile {
        name = "nitrokey-udev-rules";
        text = ''
          # Notify ModemManager this device should be ignored
          ACTION!="add|change|move", GOTO="mm_usb_device_blacklist_end"
          SUBSYSTEM!="usb", GOTO="mm_usb_device_blacklist_end"
          ENV{DEVTYPE}!="usb_device",  GOTO="mm_usb_device_blacklist_end"

          ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="42b1", ENV{ID_MM_DEVICE_IGNORE}="1"

          LABEL="mm_usb_device_blacklist_end"

          # Nitrokey FIDO2
          SUBSYSTEM=="hidraw", ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="42b1", TAG+="uaccess", SYMLINK+="nitrokey-fido2-device"

          # Nitrokey FIDO2 development console (not needed)
          SUBSYSTEM=="tty", ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="42b1", TAG+="uaccess", SYMLINK+="nitrokey-fido2-serial"
        '';
        destination = "/lib/udev/rules.d/70-nitrokey-fido2-access.rules";
      })
    ];
  };

  hardware.nitrokey.enable = true;

  # Enable CUPS & Co to print documents.
  services.printing.enable = true;
  services.printing.drivers = [pkgs.gutenprint pkgs.hplip pkgs.hplipWithPlugin];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  # Enable sound.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  #hardware.pulseaudio.enable = true;

  # Enable gnome keyring
  services.gnome.gnome-keyring.enable = true;

  # Enable clipboard history with VM
  services.greenclip.enable = true;

  # services.cron = {
  #   enable = true;
  #   systemCronJobs = [
  #     "* 20-23,00-07 * * *	dark    nvim --server /tmp/darknvimsocket  --remote-send '<C-\><C-N>:set background=dark<CR>'"
  #     "* 07-20 * * *	        dark    nvim --server /tmp/darknvimsocket  --remote-send '<C-\><C-N>:set background=light<CR>'"
  #   ];
  # };

  services.gvfs.enable = true;

  services.ratbagd.enable = true;

  # Enable anti-virus
  services.clamav = {
    updater.enable = true;
    daemon.enable = true;
  };
}
