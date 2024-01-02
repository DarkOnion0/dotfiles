{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.videoDrivers = ["amdgpu-pro"];

  # Enable OpenGL/OpenCL support
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
    amdvlk
  ];

  # Enable vulkan support
  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;
}
