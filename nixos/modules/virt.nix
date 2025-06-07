{pkgs, ...} : {
  virtualisation.libvirtd.enable = true;
  # Enable TPM emulation (optional)
  virtualisation.libvirtd.qemu = {
    swtpm.enable = true;
    ovmf.packages = [ pkgs.OVMFFull.fd ];
  };

  programs.virt-manager.enable = true;
}
