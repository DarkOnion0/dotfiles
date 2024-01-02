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
}
