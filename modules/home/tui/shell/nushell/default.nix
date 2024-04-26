{
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./config.nu;
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;
    bash = {
      enable = true;
      enableCompletion = true;
    };
  };
  xdg.configFile = {
    "nushell" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
