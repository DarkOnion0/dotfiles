{
  self,
  inputs,
  ...
}: let
  inherit (inputs) nixpkgs;

  defaultModule = {config, ...}: {
    programs.corectrl = {
      enable = true;
      gpuOverclock = {
        ppfeaturemask = "0xffffffff";
        enable = true;
      };
    };

    imports = [
      ./modules/nix-daemon.nix
      ./modules/i18n.nix
      ./modules/cups.nix
      ./modules/network.nix
      ./modules/sound.nix
      ./modules/packages.nix
      ./modules/security.nix
      ./modules/boot.nix
    ];
  };
in {
  flake.nixosConfigurations = {
    onion = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        defaultModules
        ./modules/x11.nix
        ./modules/wayland.nix
        ./modules/sway.nix

        ./modules/dark/packages.nix
        ./modules/dark/user.nix

        ./modules/bluetooth.nix
        ./modules/network.nix

        ./modules/virtualisation.nix
        ({
          pkgs,
          config,
          lib,
          ...
        }: {
          # Networking
          networking = {
            hostName = "onion";
          };

          # Boot
          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;

          boot.kernelPackages = pkgs.linuxPackages_zen;

          boot.initrd.availableKernelModules = ["nvme" "ahci" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
          boot.kernelModules = ["kvm-amd" "coretemp" "nct6775"];
          boot.supportedFilesystems = ["ntfs"];

          fileSystems."/" = {
            device = "/dev/disk/by-label/nixos";
            fsType = "xfs";
          };

          fileSystems."/boot" = {
            device = "/dev/disk/by-label/BOOT";
            fsType = "vfat";
          };

          swapDevices = [];

          # CPU
          hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

          # GPU
          services.xserver.videoDrivers = ["amdgpu"];

          hardware.opengl.enable = true;
          hardware.opengl.extraPackages = with pkgs; [
            rocm-opencl-icd
            rocm-opencl-runtime
          ];

          hardware.opengl.driSupport = true;
          hardware.opengl.driSupport32Bit = true;

          # Sys
          system.stateVersion = "22.05";
        })
      ];
    };
  };
}
