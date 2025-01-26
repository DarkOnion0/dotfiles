{pkgs, lib, config, ...}: {
  # Enable the fingerprint sensor
  services.fprintd.enable = true;

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = ["kvm-amd" "amdgpu"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44202d81-d6ed-4170-91ac-3e177e1a559f";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  boot.initrd.luks.devices."luks-384ba5f6-ff64-41fe-96b9-4e09daeece3d".device = "/dev/disk/by-uuid/384ba5f6-ff64-41fe-96b9-4e09daeece3d";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DB13-F032";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
