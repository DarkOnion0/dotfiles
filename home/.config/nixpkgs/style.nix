{pkgs, config, lib, ...}: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy-dark";
    };
  };

  qt = {
    enable = true;
    #platformTheme = "gtk";
    style = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };

}
