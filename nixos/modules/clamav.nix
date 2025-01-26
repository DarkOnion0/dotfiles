{
  # Enable anti-virus
  services.clamav = {
    updater.enable = true;
    daemon.enable = false; # For power constraint
  };
}
